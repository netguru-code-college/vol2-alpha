class Technology < ApplicationRecord
  has_many :levels
  has_many :users, through: :levels

  validates :name, :category, presence: true
  validates :name, uniqueness: true
end
