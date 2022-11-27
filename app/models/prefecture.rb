class Prefecture < ApplicationRecord
  has_many :reviews
  has_many :customers
end
