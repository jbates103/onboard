class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  before_create :assign_role

  enum role: { user: 0, admin: 1 }

  has_and_belongs_to_many :second_factors

  def assign_role
  	self.role ||= :user
  end
end
