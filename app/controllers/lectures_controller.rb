class LecturesController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @lecture = Lecture.find(params[:id])
    authorize @lecture
    @next_lecture = Lecture.where(level: @level).find_by(number: @lecture.number + 1)
    # find user to get back to user dashboard
    @user = current_user
    # find question so modal can route to first question of current level
    last_question_id = @level.course.user_course.last_question
    @question = Question.where(level_id: params[:level_id]).find_by(number: last_question_id)
    # retreieve the last question based on any quiz in progress
  end
end
