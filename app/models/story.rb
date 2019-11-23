class Story < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :text, presence: true, length: { maximum: 300 }
end
