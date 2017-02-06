class CreatePointOfContactsApps < ActiveRecord::Migration[5.0]
  def change
    create_table :point_of_contacts_apps do |t|
    	t.integer :app_id
    	t.integer :point_of_contact_id
    end
    
    add_index :point_of_contacts_apps, [:app_id, :point_of_contact_id], unique: true
  end
end
