class CreateToolsUsers < ActiveRecord::Migration
  def change
    create_table :tools_users do |t|
      t.integer :tool_id
      t.integer :user_id
    end
  end
end
