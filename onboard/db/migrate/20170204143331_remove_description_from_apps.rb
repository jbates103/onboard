class RemoveDescriptionFromApps < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apps, :description
  end
end
