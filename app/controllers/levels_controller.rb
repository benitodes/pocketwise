class LevelsController < ApplicationController
  before_action :set_level, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    # only display levels for specific course
    @levels = Level.select { |l| l.course_id == @course.id }
    # create link to usercourse table to fetch current level and current question faster
    @user_course = UserCourse.where(kid_id: current_user.id, complete: false).first

    # fetch current levelnumber from user course table

    # find all questions of current level by level id
    @level_current = 1
    @question_current = 1
    @level = @levels.find { |l| l.number == @level_current }
    @questions = Question.where(level_id: @level.id)
    # find first question that is not complete
    unless @user_course.nil?
      @question_current = @questions.find { |q| q.number == @user_course.last_question }.number
      @level_current = @user_course.last_level
    end
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
