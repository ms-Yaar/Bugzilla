class AddProjectRefToBugs < ActiveRecord::Migration[7.1]
  def change
    add_reference :bugs, :project, null: true, foreign_key: true
  end
end
