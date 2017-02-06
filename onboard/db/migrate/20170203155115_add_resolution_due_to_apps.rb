class AddResolutionDueToApps < ActiveRecord::Migration[5.0]
  def change
  	add_column :apps, :resolution, :string
  	add_column :apps, :due, :datetime
  end
end
