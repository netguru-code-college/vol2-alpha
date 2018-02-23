class Technology < ApplicationRecord
  has_many :levels
  has_many :users, through: :levels
end
