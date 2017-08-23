class AddGroupToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :group_id, :integer
  end
end
