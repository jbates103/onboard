class App < ApplicationRecord 
  include DashboardScope
  
  has_and_belongs_to_many :point_of_contacts
  has_and_belongs_to_many :descriptions
  belongs_to :assignee, class_name: 'PointOfContact', foreign_key: :assignee_id
  belongs_to :reporter, class_name: 'PointOfContact', foreign_key: :reporter_id

  enum status: { not_started: 0, in_progress: 1, blocked: 2, completed: 3, done: 4, accepted: 5 }

  validates :name, presence: true, uniqueness: true
  validates :reporter, presence: true

  default_scope { order(name: :desc) }
end
