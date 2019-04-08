class CreateGuides < ActiveRecord::Migration[5.1]
  def change
    create_table :guides do |t|
      t.string :email, null: false

      t.timestamps
    end
    add_index :guides, :email, unique: true
  end
end
