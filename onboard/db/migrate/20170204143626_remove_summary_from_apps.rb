class RemoveSummaryFromApps < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apps, :summary
  	remove_column :apps, :summary_url
  end
end
