class CreateCompletions < ActiveRecord::Migration
  def change
    create_table :completions do |t|
      t.references :mission, index: true, foreign_key: true
      t.references :repo, index: true, foreign_key: true
      t.string :commit
      t.string :filename
      t.integer :line_start
      t.integer :line_end
      t.string :gist_url

      t.timestamps null: false
    end
  end
end
