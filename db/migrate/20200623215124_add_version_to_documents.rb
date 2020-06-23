class AddVersionToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :version, :integer, null: false, default: 0
  end
end
