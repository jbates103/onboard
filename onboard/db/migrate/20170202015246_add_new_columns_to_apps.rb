class AddNewColumnsToApps < ActiveRecord::Migration[5.0]
  def change
  	add_column :apps, :jira_ticket_id, :string
  	add_column :apps, :epic, :string
  	add_column :apps, :summary, :string
  	add_column :apps, :app_updated, :datetime
  	add_column :apps, :app_created, :datetime
  end
end
