class AddRoleToProjectUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :project_users, :role, :integer
  end
end
