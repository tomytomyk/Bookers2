class RemoveUserBodyFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_body, :text
  end
end
