class LecturesController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @lecture = Lecture.find(params[:id])
    @user_course = UserCourse.where(kid: current_user, course: @level.course).first
    authorize @lecture
    @next_lecture = Lecture.where(level: @level).find_by(number: @lecture.number + 1)
    # find user to get back to user dashboard
    @user = current_user
    # find question so modal can route to first question of current level
    last_question_id = @level.course.user_courses.where(kid: current_user).first.last_question
    @question = Question.where(level_id: params[:level_id]).find_by(number: last_question_id)
    # retreieve the last question based on any quiz in progress
     #update your current question
    @user_course.last_lecture = @lecture.number
    @user_course.save
    lectures_in_level = Lecture.where(level_id: @level).length
    @lecture_progress_percentage = @lecture.number.to_f / lectures_in_level.to_f * 100
    @first_question_current_level = Question.where(level_id: @level).first.id
  end
end
