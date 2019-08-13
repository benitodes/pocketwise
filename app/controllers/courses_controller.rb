class CoursesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @courses = Course.all
    # only display courses for specific category
    @courses = @courses.select { |t| t.category == @category }
  end
end
