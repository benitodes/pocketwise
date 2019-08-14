class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dashboard?
    return record == user if user.kid
    return record == user || user.is_parent_of?(record)
  end

  def new?
    user.parent
  end

  def create?
    user.parent
  end

  def destroy?
    user.is_parent_of?(record)
  end
end
