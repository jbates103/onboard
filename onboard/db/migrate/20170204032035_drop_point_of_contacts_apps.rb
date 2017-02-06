class DropPointOfContactsApps < ActiveRecord::Migration[5.0]
  def change
  	drop_table :point_of_contacts_apps
  end
end
