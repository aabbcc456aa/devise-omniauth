class AddOtherColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nick, :string
    add_column :users, :image_url, :string
  end
end
