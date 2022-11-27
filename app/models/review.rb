class Review < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :customer
  belongs_to :prefecture

  has_many_attached :images

  validates :venue, presence: true
  validates :chapel, presence: true
  validates :reception, presence: true
  validates :food, presence: true
  validates :staff, presence: true
  validates :access, presence: true
  validates :comment, presence: true

  def self.looks(keyword)
      Review.where("venue LIKE?","%#{keyword}%")
  end

end
