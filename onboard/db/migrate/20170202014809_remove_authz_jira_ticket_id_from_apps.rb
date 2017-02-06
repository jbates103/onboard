class RemoveAuthzJiraTicketIdFromApps < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apps, :authz_jira_ticket_id
  end
end
