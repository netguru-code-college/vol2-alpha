class Level < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  validates :level, presence: true
end
