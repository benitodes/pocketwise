class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

   def index_courses
    @category = Category.find(params[:category_id])
    # only display courses for specific category
    @courses = Course.select { |t| t.category == @category }
    # display complete when course is complete
    # iterate through course
    @courses.each do |course|
      unless course.user_courses.where(kid: current_user).first.nil?
        # course is complete if last_level = number of course levels + 1
        course.user_courses.where(kid: current_user).first.complete = true if course.user_courses.where(kid: current_user).first.last_level == course.levels.length + 1
        # reset course when complete so kid will start from level one question one again
        course.user_courses.where(kid: current_user).first.last_level = 1
        course.user_courses.where(kid: current_user).first.last_question = 1
        course.user_courses.where(kid: current_user).first.last_lecture = 1
      end
    end

      end



    # to do : if user course is there then enroll @message

end
