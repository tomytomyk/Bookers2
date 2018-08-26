class AddUserBodyUsers < ActiveRecord::Migration[5.2]
  def change
  	  add_column :users, :user_body, :text
  end
end
