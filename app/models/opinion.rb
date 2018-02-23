class Opinion < ApplicationRecord
  has_many :users_opinions
  has_many :users, through: :users_opinions

  validates :user, :content, :rating, presence: true
end
