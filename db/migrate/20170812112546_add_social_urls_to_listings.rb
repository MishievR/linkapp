class AddSocialUrlsToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :twitter_url, :string
    add_column :listings, :facebook_url, :string
    add_column :listings, :linkedin_url, :string
    add_column :listings, :instagram_url, :string
    add_column :listings, :snapchat_url, :string
    add_column :listings, :youtube_url, :string
    add_column :listings, :angellist_url, :string
    add_column :listings, :medium_url, :string
    add_column :listings, :producthunt_url, :string
    add_column :listings, :reddit_url, :string
    add_column :listings, :twitch_url, :string
  end
end
