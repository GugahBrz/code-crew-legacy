class Document < ApplicationRecord
  belongs_to :user

  has_many :permissions, dependent: :destroy
end
