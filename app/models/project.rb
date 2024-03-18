class Project < ApplicationRecord
    has_many :bugs, dependent: :destroy
    has_many :project_users,dependent: :destroy
    has_many :users, through: :project_users
    accepts_nested_attributes_for :users
    belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
    belongs_to :developer, class_name: "User", foreign_key: "user_id", optional: true

end
