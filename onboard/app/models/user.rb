class User < ApplicationRecord
  has_and_belongs_to_many :second_factors
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  
  validates :role, presence: true

  enum role: { user: 0, admin: 1 }

  before_validation :set_user_role

  def set_user_role
  	self.role ||= :user
  end
end
