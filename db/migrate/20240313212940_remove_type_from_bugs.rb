class RemoveTypeFromBugs < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :type, :integer
  end
end
