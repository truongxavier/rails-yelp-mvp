# frozen_string_literal: true

# model Review
class Review < ApplicationRecord
  belongs_to :restaurant

  # validates :rating, inclusion: [0..5]
  validates :content, :rating, :restaurant_id, presence: true
end
