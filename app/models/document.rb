class Document < ApplicationRecord
  belongs_to :user

  has_many :permissions, dependent: :destroy
  has_many :operations, dependent: :destroy

  def apply_changes(operation)
    if operation.kind == 'insert'
      content.insert(operation.data['offset'], operation.data['text'])
    elsif operation.kind == 'remove'
      content.slice!(operation.data['offset'], operation.data['text'].length)
    end

    self.version = operation.version + 1

    self
  end
end
