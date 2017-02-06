class CreateAppsDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :apps_descriptions do |t|
    	t.integer :app_id
    	t.integer :description_id
    end
  end
end
