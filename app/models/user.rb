class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :parent_wallets, foreign_key: "parent_id", class_name: "Wallet", dependent: :destroy
  has_one :kid_wallet, foreign_key: "kid_id", class_name: "Wallet", dependent: :destroy
  has_many :user_courses, foreign_key: "kid_id", class_name: "UserCourse", dependent: :destroy
  has_many :goals, through: :wallet

  mount_uploader :avatar, PhotoUploader
end
