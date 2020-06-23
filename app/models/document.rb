class Document < ApplicationRecord
  belongs_to :user

  has_many :permissions, dependent: :destroy

  has_many :operations
end
