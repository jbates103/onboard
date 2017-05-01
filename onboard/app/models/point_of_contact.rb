class PointOfContact < ApplicationRecord
  include DashboardScope
  
  has_and_belongs_to_many :apps, dependent: :delete
  has_one :assignee, class_name: 'App', foreign_key: :assignee_id, dependent: :nullify
  has_one :reporter, class_name: 'App', foreign_key: :reporter_id

  validates :first_name, presence: true
  validates :last_name, presence: true, uniqueness: { scope: :first_name }
  validates :email, presence: true, uniqueness: true, 
  			email: { mx: true, domain: true, ban_disposable_email: true }

  default_scope { order(last_name: :asc) }
  
  max_paginates_per 100  
end
