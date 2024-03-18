class AddTypeAndStatusToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :type, :integer
    add_column :bugs, :status, :integer
  end
end
