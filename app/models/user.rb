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
