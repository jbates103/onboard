class App < ApplicationRecord 
  include DashboardScope
  
  has_and_belongs_to_many :point_of_contacts, dependent: :delete
  has_and_belongs_to_many :descriptions, dependent: :delete
  belongs_to :assignee, class_name: 'PointOfContact', foreign_key: :assignee_id
  belongs_to :reporter, class_name: 'PointOfContact', foreign_key: :reporter_id

  enum status: { not_started: 0, in_progress: 1, blocked: 2, completed: 3, done: 4, accepted: 5 }

  enum label: { dt: 0, pt: 1, dm: 2, preprod: 3, prod: 4}

  validates :name, presence: true, uniqueness: true
  validates :reporter, presence: true

  default_scope { order(name: :desc) }

  scope :all_reporter_apps, -> (reporter_id) { where(reporter_id: reporter_id) }
  scope :all_assignee_apps, -> (assignee_id) { where(assignee_id: assignee_id) }

  def lower_environments?
    dt? || pt? || dm?
  end

  def production?
    preprod? || prod?
  end

  def self_assignment?
    assignee.email == reporter.email
  end
end
