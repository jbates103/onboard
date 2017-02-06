class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :url
      t.integer :owner_poc_id
      t.integer :icam_poc_id
      t.integer :user_population
      t.string :authn_jira_ticket_id
      t.string :authz_jira_ticket_id
      t.string :sso_technology
      t.text :comment
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
