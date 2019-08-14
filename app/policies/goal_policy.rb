class GoalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.wallet.kid == user
  end

  def create?
    record.wallet.kid == user
  end

  def edit?
    record.wallet.kid == user
  end

  def update?
    record.wallet.kid == user
  end

  def destroy?
    record.wallet.kid == user
  end
end
