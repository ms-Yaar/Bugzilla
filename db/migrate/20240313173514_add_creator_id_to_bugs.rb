class AddCreatorIdToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :creator_id, :integer
  end
end
