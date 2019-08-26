class AddUrlsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :fb_url, :string
    add_column :customers, :insta_url, :string
    add_column :customers, :site_url, :string
  end
end
