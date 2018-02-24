# == Schema Information
#
# Table name: levels
#
#  id            :integer          not null, primary key
#  level         :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  technology_id :integer
#

class Level < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  validates :level, presence: true
end
