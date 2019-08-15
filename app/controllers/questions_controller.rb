class QuestionsController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @question = Question.find(params[:id])
    authorize @question
    @next_question = Question.where(level: @level).find_by(number: @question.number + 1)
    @answers = Answer.where(question_id: @question)
    @user = current_user
  end

  def increase_level
    # find actual level
    level = Level.find(params[:level_id])
    authorize @question
    # find current user_course in which kid is enrolled
    user_course = level.course.user_course
    # only increase level by one if last_level is inferior to the current level
    if user_course.last_level < level.number
      user_course.last_level += 1
      user_course.save
    end
    # in any case redirect to dashboard
    redirect_to dashboard_user_path(current_user)
  end
end
