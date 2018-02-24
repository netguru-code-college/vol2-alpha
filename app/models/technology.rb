# == Schema Information
#
# Table name: technologies
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Technology < ApplicationRecord
  has_many :levels
  has_many :users, through: :levels

  validates :name, :category, presence: true
  validates :name, uniqueness: true
end
