class Breed < ApplicationRecord
  belongs_to :group
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :image_url, presence: true
end