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

class User < ApplicationRecord
  has_many :levels
  has_many :technologies, through: :levels
  has_many :speakers
  has_many :languages, through: :speakers
  has_many :received_opinions, foreign_key: "user_id", class_name: "Opinion"
  has_many :written_opinions, foreign_key: "author_id", class_name: "Opinion"
  
  validates :first_name, :last_name, :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
