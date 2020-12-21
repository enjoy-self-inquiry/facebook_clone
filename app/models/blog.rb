class Blog < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 100 }
  mount_uploader :image, ImageUploader
  default_scope -> { order(created_at: :desc) }
end
