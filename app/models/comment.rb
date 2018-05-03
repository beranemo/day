class Comment < ApplicationRecord
  belongs_to :user, class_name: "User", primary_key: "id", foreign_key: "user_id"
  belongs_to :restaurant
end
