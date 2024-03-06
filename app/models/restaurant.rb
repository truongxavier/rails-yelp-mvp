# frozen_string_literal: true

# model Restaurant
class Restaurant < ApplicationRecord
  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :name, :address, presence: true

  def rating
    rating_sum = 0
    reviews.each do |review|
      rating_sum += review.rating
    end
    if reviews.count>0
      rating_sum.div(reviews.count)
    end
  end
end
