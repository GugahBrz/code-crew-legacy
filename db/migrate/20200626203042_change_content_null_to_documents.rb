class ChangeContentNullToDocuments < ActiveRecord::Migration[6.0]
  def change
    Document.where(content: nil).update_all(content: '')

    change_column_null :documents, :content, false
  end
end
