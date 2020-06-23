class Operation < ApplicationRecord
  belongs_to :document

  serialize :data, JSON

  validates :document_id, presence: true

  # There's only one version of data
  validates :version, presence: true, uniqueness: { scope: :document_id }
end
