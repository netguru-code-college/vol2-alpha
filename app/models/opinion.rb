class Opinion < ApplicationRecord
  validates :user, :content, :rating, presence: true
end
