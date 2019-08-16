class LevelsController < ApplicationController
  before_action :set_level, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    # only display levels for specific course
    @levels = Level.select { |l| l.course_id == @course.id }
    # create link to usercourse table to fetch current level and current question faster
    @user_course = UserCourse.where(kid_id: current_user.id, complete: false).first

    # fetch current levelnumber from user course table
    if @user_course.nil?
      @level_current = 1
      @user_course = UserCourse.create!(course_id: 1, last_level: 1, last_lecture: 1, last_question: 1, kid_id: current_user.id, complete: false)
    else
      @level_current = @user_course.last_level
    end
    # find level id by level number
    @level = @levels.find { |l| l.number == @level_current }
    # find all questions of current level by level id
    @questions = Question.where(level_id: @level.id)
    # find first question that is not complete
    @question_current = @questions.find { |q| q.number == @user_course.last_question }
  end

  def show
    @course = Course.find(@level.course_id)
    authorize @level
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end
end
