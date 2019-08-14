class UserCoursesController < ApplicationController
  def create
    course = Course.find(params[:course_id])
    usercourse = UserCourse.new(
      course: course,
      kid: current_user,
      last_level: 1,
      last_question: 1,
      last_lecture: 1,
      complete: false
    )

    # find level with current course id and select level 1
    level = Level.where(course: usercourse.course).find_by(number: usercourse.last_level)

    if usercourse.save
      redirect_to level_path(level)
    else
      flash[:warning] = 'something happened here'
      render 'levels#index'
    end
  end
end
