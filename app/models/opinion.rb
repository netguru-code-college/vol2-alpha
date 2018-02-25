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
# Indexes
#
#  index_opinions_on_author_id  (author_id)
#  index_opinions_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (user_id => users.id)
#

class Opinion < ApplicationRecord
  belongs_to :user, foreign_key: "user_id", class_name: "User"
  belongs_to :author, foreign_key: "author_id", class_name: "User"

  validates :user, :content, :rating, presence: true
end
