class LevelsController < ApplicationController
  before_action :set_level, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    # only display levels for specific course
    @levels = Level.select { |l| l.course_id == @course.id }
    # create link to usercourse table to fetch current level and current question faster
    @user_course = UserCourse.where(kid_id: current_user.id, complete: false).first
    @level_current = 1
    @question_current = 1
    @level = @levels.find { |l| l.number == @level_current }
    @questions = Question.where(level_id: @level.id)

    # find first question that is not complete
    unless @user_course.nil?
      @level_current = @user_course.last_level
      @question_current = @questions.find { |q| q.number == @user_course.last_question }.number
    end
  end

  def show
    @lectures_complete = lectures_complete?
    @course = Course.find(@level.course_id)
    authorize @level
    raise
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end

  def lectures_complete?
    # find current course
    @user_course = UserCourse.where(kid_id: current_user.id, course_id: @course).first
    if @user_course
      # find first level user has not completed (not necessarily current level!!)
      level_current = @user_course.last_level
      # find number of questions in current level
      @lectures = Lecture.where(level_id: params[:id])
      number_of_lectures = @lectures.length
      # find current lecture number
      @lecture_current = @lectures.find { |l| l.number == @user_course.last_lecture }.number
      # if current question number equals total amount of lectures OR Course complete, then
      # lectures complete. WHAT ABOUT LEVEL COMPLETE?
      @lecture_current == number_of_lectures   ? true : false
    else
      false
    end
  end
end
