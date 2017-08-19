class CreatePersonGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :person_groups do |t|
      t.integer :person_id
      t.integer :group_id
      t.timestamps
    end
  end
end
