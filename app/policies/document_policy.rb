class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      owned_documents + shared_documents
    end

    private

    def owned_documents
      scope.where(user: user)
    end

    def shared_documents
      scope.includes(:permissions).where(permissions: { user: user })
    end
  end

  def show?
    owner? || writer? || reader?
  end

  def update?
    owner? || writer?
  end

  def update_permissions?
    owner?
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
    permission.writer?
  end

  def reader?
    permission.reader?
  end

  def permission
    record.permissions.select { |permission| permission.user == user }.first
  end
end
