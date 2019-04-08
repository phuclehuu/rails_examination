class CreateJoinTableGuideLanguage < ActiveRecord::Migration[5.1]
  def change
    create_join_table :guides, :languages do |t|
      t.references :guide, foreign_key: true
      t.references :language, foreign_key: true
    end
  end
end
