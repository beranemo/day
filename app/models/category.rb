class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  
  has_many :restaurants, dependent: :destroy
  # has_many :rrr, class_name: "Restaurant", primary_key: "id", foreign_key: "category_id"

end
