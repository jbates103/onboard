class PointOfContact < ApplicationRecord
  include DashboardScope
  
  has_and_belongs_to_many :apps
  has_one :app, class_name: 'App', foreign_key: :assignee_id
  has_one :app, class_name: 'App', foreign_key: :reporter_id

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: :first_name }
  validates :email, presence: true, uniqueness: true, 
  			email: { mx: true, domain: true, ban_disposable_email: true }
  
end
