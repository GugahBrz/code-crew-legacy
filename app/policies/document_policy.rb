class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    owner? || writer? || reader?
  end

  def update?
    owner? || writer?
  end

  def destroy?
    owner?
  end

  alias_method :edit?, :update?

  private

  def owner?
    user == record.user
  end

  def writer?
    false
  end

  def reader?
    false
  end
end
