class QuestionsController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @question = Question.find(params[:id])
    @next_question = Question.where(level: @level).find_by(number: @question.number + 1)
    @answers = Answer.where(question_id: @question)
    @user = current_user
  end
end
