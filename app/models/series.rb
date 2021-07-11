class Series < ApplicationRecord
  has_and_belongs_to_many :actors
  has_many :reviews
  has_and_belongs_to_many :locations
end
