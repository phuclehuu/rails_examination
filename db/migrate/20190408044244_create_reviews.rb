class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :score, limit: 1, null: false
      t.string :comment
      t.references :guide, foreign_key: true

      t.timestamps
    end
  end
end
