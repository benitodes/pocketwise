class CoursesController < ApplicationController
  before_action :set_course, only: [:index]
  before_action :course_params, only: [:index]

  def index
    @category = Category.find(params[:category_id])
    @courses = Course.all
    # only display courses for specific category
    @courses = @courses.select { |t| t.category == @category }
  end

  private

  def set_course
    # @course = Course.find(params[:id])
  end

  def course_params
    # params.require(:course).permit(:category)
  end
end
