class Wallet < ApplicationRecord
  belongs_to :kid, class_name: "User"
  belongs_to :parent, class_name: "User"
  has_many :goals, dependent: :destroy
end
