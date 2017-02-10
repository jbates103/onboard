class Staff < ApplicationRecord
	include DashboardScope
	
	validates :email, presence: true, uniqueness: true,
			 email: { mx: true, domain: true, ban_disposable_email: true }
	validates :first_name, presence: true
	validates :last_name, presence: true, uniqueness: { scope: :first_name }
end
