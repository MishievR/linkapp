class CreatePersonUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :person_users do |t|
      t.integer :person_id
      t.integer :user_id
      t.timestamps
    end
  end
end
