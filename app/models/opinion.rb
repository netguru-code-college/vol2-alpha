class Opinion < ApplicationRecord
  has_many :users_opinions
  has_many :users, through: :users_opinions
end
