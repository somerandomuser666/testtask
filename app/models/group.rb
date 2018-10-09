class Group < ApplicationRecord
  has_many :matches, dependent: :destroy
  has_and_belongs_to_many :teams

  scope :final,         -> { where(title: "final") }
  scope :half_final,    -> { where(title: "1_2") }
  scope :quarter_final, -> { where(title: "1_4") }
  scope :play_off,      -> { where(title: "play_off") }
end
