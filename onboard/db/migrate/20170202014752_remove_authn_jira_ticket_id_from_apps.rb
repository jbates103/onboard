class RemoveAuthnJiraTicketIdFromApps < ActiveRecord::Migration[5.0]
  def change
  	remove_column :apps, :authn_jira_ticket_id
  end
end
