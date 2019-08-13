class QuestionsController < ApplicationController
  # before_action :set_questions, only: [:show]

  def show
    @level = Level.find(params[:level_id])
   # @questions = Question.select { |q| q.level_id == @level.id }
    @question = Question.find(params[:id])
    @next_question = Question.where(level: @level).find_by(number: @question.number + 1)
    # @questions = Question.all
    # @questions = @questions.select { |q| q.level_id == @level }
    # @answers = Answer.all
    # @answers = @answers.select { |q| q.question_id == @question.id }
  end

  private

  def set_questions

  end
end
