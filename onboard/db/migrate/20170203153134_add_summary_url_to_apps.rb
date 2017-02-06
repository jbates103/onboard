class AddSummaryUrlToApps < ActiveRecord::Migration[5.0]
  def change
  	add_column :apps, :summary_url, :string
  	rename_column :apps, :url, :app_url
  end
end
