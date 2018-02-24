# == Schema Information
#
# Table name: opinions
#
#  id         :integer          not null, primary key
#  rating     :integer          not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  author_id  :integer
#

class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  validates :user, :content, :rating, presence: true
end
