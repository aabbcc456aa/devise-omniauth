class CreateOmniauthMessages < ActiveRecord::Migration
  def change
    create_table :omniauth_messages do |t|

      t.timestamps
    end
  end
end
