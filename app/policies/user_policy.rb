class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    record == user || record.kid_wallet.parent == user
  end

  def new?
    record.parent
  end

  def create?
    record.parent
  end

  def destroy?
    record.kid_wallet.parent == user
  end
end
