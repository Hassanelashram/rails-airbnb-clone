
class User < ApplicationRecord
  has_many :cars
  has_many :favorites
  has_many :bookings
  has_one_attached :photo
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
