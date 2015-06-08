class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :name
      t.string :primary_color
      t.string :secondary_color
      t.text :description
      t.text :url

      t.timestamps null: false
    end
  end
end
