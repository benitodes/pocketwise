class LevelsController < ApplicationController
  before_action :set_level, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    # only display levels for specific course
    @levels = Level.select { |l| l.course_id == @course.id }
    # create link to usercourse table to fetch current level and current question faster
    @user_course = UserCourse.where(kid_id: current_user.id).first
    @level_current = 1
    @question_current = 1
    @level = @levels.find { |l| l.number == @level_current }
    @questions = Question.where(level_id: @level.id)
    # find first question that is not complete
    unless @user_course.nil?
      @level_current = @user_course.last_level
      @question_current = @questions.find { |q| q.number == @user_course.last_question }.number
      # reset last level, question and lecture if course is complete so kid can start over again
      reset_course_if_complete
    end
  end

  def show
    @course = Course.find(@level.course_id)
    authorize @level
    @user_course = UserCourse.where(kid_id: current_user.id, course_id: @course).first
    @lectures_complete = lectures_complete?(@user_course)
    reset_course_if_complete
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end

  def lectures_complete?(user_course)
    # check if user course is nil
    if @user_course
      # find number of lectures in current level
      @lectures = Lecture.where(level_id: params[:id])
      @number_of_lectures = @lectures.length
      # find current lecture number
      @lecture_current = @lectures.find { |l| l.number == @user_course.last_lecture }
      # if no current lecture number then user hasn't done lectures yet --> default to one
      # NOT NECESSARY IF LEVEL DISABLED IF IT IS NOT DONE YET
      if @lecture_current.nil?
        @lecture_current = 1
      else
        @lecture_current = @lecture_current.number
      end
      # is level complete?
      @level_complete = CompletedLevel.where(level_id: params[:id], user_course_id: @user_course).first
      @level_complete.nil? ? @level_complete = false : @level_complete = true
      # if current lecture number equals total amount of lectures OR Course complete OR level complete then return true
      @lecture_current == @number_of_lectures || @user_course.complete || @level_complete
    else
      false
    end
  end

  def reset_course_if_complete
    if @user_course.complete
      @user_course.last_level = 1
      @user_course.last_question = 1
      @user_course.last_lecture = 1
      @user_course.save
    end
  end
end
