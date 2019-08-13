class QuestionsController < ApplicationController
  # before_action :set_questions, only: [:show]

  def show
    @level = Level.find(params[:level_id])
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question)
    @next_question = Question.where(level: @level).find_by(number: @question.number + 1)
    byebug
  end

  private

  def set_questions
  end
end
