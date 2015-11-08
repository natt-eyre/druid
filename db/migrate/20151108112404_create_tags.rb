class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null:false
      t.string :color
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
