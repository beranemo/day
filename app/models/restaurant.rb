class Restaurant < ApplicationRecord
  validates :name, presence: true
  mount_uploader :image, PhotoUploader
  belongs_to :category
  #belongs_to :ccc, class_name: "Category", primary_key: "id", foreign_key: "category_id"

  has_many :comments
end
