class Comment < ApplicationRecord
  belongs_to :user, class_name: "User", primary_key: "id", foreign_key: "user_id"
  belongs_to :custom, class_name: "Restaurant", primary_key: "id", foreign_key: "restaurant_id"
end
