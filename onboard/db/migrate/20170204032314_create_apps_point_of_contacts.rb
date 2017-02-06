class CreateAppsPointOfContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :apps_point_of_contacts do |t|
      t.integer :app_id
      t.integer :point_of_contact_id
    end
    add_index :apps_point_of_contacts, [:app_id, :point_of_contact_id], unique: true
  end
end
