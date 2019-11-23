class Story < ApplicationRecord
  has_many :comments
  validates :name, uniqueness: true, presence: true
  validates :text, presence: true, length: { maximum: 300 }
end
