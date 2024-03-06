# frozen_string_literal: true

# model Category
class Category < ApplicationRecord
  has_many :restaurants
end
