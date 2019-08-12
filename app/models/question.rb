class Question < ApplicationRecord
  belongs_to :level
  has_many :answers, dependent: :destroy
end
