class ChangeUserAdmin < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_role, :admin
  end
end
