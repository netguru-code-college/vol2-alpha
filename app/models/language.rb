class Language < ApplicationRecord
  has_many :speakers
  has_many :users, through: :speakers

  validates :name, presence: true
end
