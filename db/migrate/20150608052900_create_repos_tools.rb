class CreateReposTools < ActiveRecord::Migration
  def change
    create_table :repos_tools do |t|
      t.integer :repo_id
      t.integer :tool_id
    end
  end
end
