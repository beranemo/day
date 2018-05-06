class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  # 「使用者評論很多餐廳」的多對多關聯
  has_many :comments, dependent: :restrict_with_error
  has_many :commented_restaurants, through: :comments, source: :restaurant

  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  
  # 一個 User 擁有很多追蹤紀錄 (followships)
  # 透過追蹤紀錄，一個 User 追蹤很多其他 User (followings)
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  
  def admin?
    self.role == "admin"
  end
  
  def following?(user)
    self.followings.include?(user)
  end
  
end
