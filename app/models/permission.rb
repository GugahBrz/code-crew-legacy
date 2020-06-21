class Permission < ApplicationRecord
  belongs_to :document
  belongs_to :user

  class Role < Enum
    WRITER = 'writer'
    READER = 'reader'
  end

  attribute :role,:string, default: Role::WRITER
  validates :role, inclusion: { in: Role.values }

  def writer?
    role == Role::WRITER
  end

  def reader?
    role == Role::READER
  end
end
