# == Schema Information
#
# Table name: technologies
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_technologies_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

class Technology < ApplicationRecord
  has_many :levels
  has_many :users, through: :levels
  belongs_to :category

  validates :name, :category, presence: true
  validates :name, uniqueness: true
end
