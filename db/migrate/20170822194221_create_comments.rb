class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :person_id
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :comments, :person_id
  end
end
