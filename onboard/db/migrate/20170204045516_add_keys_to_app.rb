class AddKeysToApp < ActiveRecord::Migration[5.0]
  def change
  	add_column :apps, :reporter_id, :integer
  	add_column :apps, :assignee_id, :integer
  end
end
