class RenameListingsNew < ActiveRecord::Migration[5.0]
  def change
    rename_table :listings, :persons
  end
end
