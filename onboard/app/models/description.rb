class Description < ApplicationRecord
  has_and_belongs_to_many :apps, dependent: :delete
end
