class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments,dependent: :destroy

  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 200 }
end
