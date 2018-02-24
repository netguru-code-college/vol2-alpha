class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  validates :user, :content, :rating, presence: true
end
