class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :xxxtalk, class_name: "Comment", primary_key: "id", foreign_key: "user_id"  
  has_many :restaurants, through: :xxxtalk, source: :custom
  
  def admin?
    self.role == "admin"
  end

end
