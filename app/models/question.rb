class Question < ApplicationRecord
  belongs_to :level
  has_many :answers, dependent: :destroy
  validates :question_content, :hint, presence: true
end
