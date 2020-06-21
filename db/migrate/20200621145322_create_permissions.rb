class CreatePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :permissions do |t|
      t.references :document, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.string :role, null: false

      t.timestamps
    end
  end
end
