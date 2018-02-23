class User < ApplicationRecord
  has_many :levels
  has_many :technologies, through: :levels
  has_many :users_opinions
  has_many :opinions, through: :users_opinions
  has_many :speakers
  has_many :languages, through: :speakers
  validates :first_name, :last_name, :email, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
