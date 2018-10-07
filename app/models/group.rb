class Group < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_and_belongs_to_many :teams
end
