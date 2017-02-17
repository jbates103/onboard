module DashboardScope
  extend ActiveSupport::Concern

  included do
  	scope :new_entries, -> (datetime) { where("created_at >= ?", datetime) }
  	scope :sample_data, -> { all.limit(10) }
  	scope :last_five, -> { all.limit(5) }
  end
end