class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def increase_level?
    true
  end

  def increase_question_number?
    true
  end
end
