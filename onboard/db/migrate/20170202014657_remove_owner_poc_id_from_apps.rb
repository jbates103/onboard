class RemoveOwnerPocIdFromApps < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apps, :owner_poc_id
  end
end
