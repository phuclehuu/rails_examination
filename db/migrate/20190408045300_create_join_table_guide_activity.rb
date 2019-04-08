class CreateJoinTableGuideActivity < ActiveRecord::Migration[5.1]
  def change
    create_join_table :guides, :activities do |t|
      t.references :guide, foreign_key: true
      t.references :activity, foreign_key: true
    end
  end
end
