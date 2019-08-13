class LevelsController < ApplicationController
  before_action :set_level, only: [:show]

  def index
    @course = Course.find(params[:course_id])
    @levels = Level.all
    # only display levels for specific category
    @levels = @levels.select { |l| l.course_id == @course.id }
    # finds first level that is not completed
    @level_current = @levels.find { |l| l.complete == false }
  end

  def show
    @course = Course.find(@level.course_id)
  end

  private

  def set_level
    @level = Level.find(params[:id])
  end
end
