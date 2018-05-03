class Restaurant < ApplicationRecord
  validates :name, presence: true
  mount_uploader :image, PhotoUploader
  belongs_to :category
  #belongs_to :ccc, class_name: "Category", primary_key: "id", foreign_key: "category_id"

  has_many :comments, class_name: "Comment", primary_key: "id", foreign_key: "restaurant_id"
end
