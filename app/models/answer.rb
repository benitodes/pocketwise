class Answer < ApplicationRecord
  belongs_to :question
  validates :answer_content, :correct, presence: true
end
