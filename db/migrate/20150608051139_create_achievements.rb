class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.text :name
      t.text :summary
      t.text :found_in
      t.text :documentation_url
      t.string :version_added
      t.string :version_removed
      t.integer :version, options: { default: 1 }
      t.references :user, index: true, foreign_key: true
      t.references :tool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
