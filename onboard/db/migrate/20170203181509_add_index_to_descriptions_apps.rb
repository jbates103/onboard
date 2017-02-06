class AddIndexToDescriptionsApps < ActiveRecord::Migration[5.0]
  def change
  	add_index :apps_descriptions, [:app_id, :description_id], unique: true
  end
end
