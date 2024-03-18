class AddBugTypeToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :bug_type, :integer
  end
end
