class CoursesController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    # only display courses for specific category
    @courses = Course.select { |t| t.category == @category }
    # display complete when course is complete
    # iterate through course
    @courses.each do |course|
      unless course.user_course.nil?
        # course is complete if last_level = number of course levels + 1
        course.user_course.complete = true if course.user_course.last_level == course.levels.length + 1
        # reset course when complete so kid will start from level one question one again
        course.user_course.last_level = 1
        course.user_course.last_question = 1
        course.user_course.last_lecture = 1
      end
    end
    # to do : if user course is there then enroll @message
  end
end
