class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def update?
    owner? || editor? || reader?
  end

  alias_method :edit?, :update?
  alias_method :show?, :update?
  alias_method :destroy?, :update?

  private

  def owner?
    user == record.user
  end

  def editor?
    false
  end

  def reader?
    false
  end
end
