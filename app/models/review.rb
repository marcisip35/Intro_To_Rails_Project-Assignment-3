class Review < ApplicationRecord
  belongs_to :breed

  validates :reviewer_name, presence: true
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :comment, presence: true
  validates :playfulness, presence: true, inclusion: { in: 1..5 }
  validates :affection, presence: true, inclusion: { in: 1..5 }
  validates :ease_of_care, presence: true, inclusion: { in: 1..5 }
end