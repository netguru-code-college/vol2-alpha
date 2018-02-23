class User < ApplicationRecord
  has_many :levels
  has_many :technologies, through: :levels
  has_many :users_opinions
  has_many :opinions, through: :users_opinions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
