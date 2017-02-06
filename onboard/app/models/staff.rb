class Staff < ApplicationRecord
	validate :email, presence: true, uniqueness: true,
			 email: { mx: true, domain: true, ban_disposable_email: true }
	validate :first_name, presence: true
	validate :last_name, presence: true, uniqueness: { scope: :first_name }
end
