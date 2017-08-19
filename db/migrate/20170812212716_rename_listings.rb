class RenameListings < ActiveRecord::Migration[5.0]
  def change
    def self.up
      rename_table :listings, :persons
    end

    def self.down
      rename_table :persons, :listings
    end
  end
end
