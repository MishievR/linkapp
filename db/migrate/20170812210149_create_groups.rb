class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :title
      t.string :tag_line
      t.string :group_image
      t.string :group_background_image
      t.integer :rank, default: 0, null: false
      t.text :description
      t.timestamps
    end
  end
end
