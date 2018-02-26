# == Schema Information
#
# Table name: levels
#
#  id            :integer          not null, primary key
#  level         :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  technology_id :integer
#
# Indexes
#
#  index_levels_on_technology_id  (technology_id)
#  index_levels_on_user_id        (user_id)
#

class Level < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  validates :level, presence: true
end
