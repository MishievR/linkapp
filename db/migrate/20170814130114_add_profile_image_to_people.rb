class AddProfileImageToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :profile_image_url, :string
  end
end
