class RemoveDeadlineFromBugs < ActiveRecord::Migration[7.1]
  def change
    remove_column :bugs, :deadline, :date
  end
end
