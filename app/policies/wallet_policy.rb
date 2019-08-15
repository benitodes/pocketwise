class WalletPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    record.parent == user
  end

  def update?
    record.parent = user
  end

  def show?
    record = user || record.parent = user
  end
end
