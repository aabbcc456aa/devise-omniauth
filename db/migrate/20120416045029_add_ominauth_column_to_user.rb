class AddOminauthColumnToUser < ActiveRecord::Migration
  def change
    #sina 
    add_column :users, :sina_uid, :string
    add_column :users, :sina_oauth_token, :string
    add_column :users, :sina_oauth_token_secret, :string
    #douban 
    add_column :users, :douban_uid, :string
    add_column :users, :douban_oauth_token, :string
    add_column :users, :douban_oauth_token_secret, :string
    #t163 
    add_column :users, :t163_uid, :string
    add_column :users, :t163_oauth_token, :string
    add_column :users, :t163_oauth_token_secret, :string
    #tsohu 
    add_column :users, :tsohu_uid, :string
    add_column :users, :tsohu_oauth_token, :string
    add_column :users, :tsohu_oauth_token_secret, :string  
    #tqq 
    add_column :users, :tqq_uid, :string
    add_column :users, :tqq_oauth_token, :string
    add_column :users, :tqq_oauth_token_secret, :string  
    #qzone
    add_column :users, :qzone_uid, :string
    add_column :users, :qzone_oauth_token, :string
    add_column :users, :qzone_oauth_token_secret, :string
  end
end
