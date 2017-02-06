class RemoveIcamPocIdFromApps < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apps, :icam_poc_id
  end
end
