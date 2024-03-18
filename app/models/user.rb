class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
        
         has_many :project_users
         has_many :projects, through: :project_users
         accepts_nested_attributes_for :projects
         has_many :bugs, dependent: :destroy
         enum role: { manager: 0, qa: 1, developer: 2 }


         mount_uploader :avatar, AvatarUploader


end
