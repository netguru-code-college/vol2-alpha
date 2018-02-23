class Language < ApplicationRecord
  has_many :speakers
  has_many :users, through: :speakers
end
