# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string           not null
#  last_name              :string           not null
#  description            :text
#  location               :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord

  include Gravtastic
  is_gravtastic!

  include PgSearch
  pg_search_scope :search, against: [:first_name, :last_name, :location],
                           associated_against: { technologies: [:name],
                                                 languages: [:name] },
                           using: { tsearch: { prefix: true,
                                               dictionary: "english" } }

  has_many :levels
  has_many :technologies, through: :levels
  has_many :speakers
  has_many :languages, through: :speakers
  has_many :received_opinions, foreign_key: "user_id", class_name: "Opinion"
  has_many :written_opinions, foreign_key: "author_id", class_name: "Opinion"
  has_many :hosted_meetups, foreign_key: "author_id", class_name: "Meetup"

  validates :first_name, :last_name, :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def average_rating
    avg = 0
    ratings = received_opinions.pluck(:rating)
    avg = ratings.sum / ratings.size.to_f if ratings.size > 0
    avg.round(2)
  end

  def self.top
    all.sort_by(&:average_rating).last(30).reverse
  end
end
