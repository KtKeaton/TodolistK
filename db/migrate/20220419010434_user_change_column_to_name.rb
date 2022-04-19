class UserChangeColumnToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :role, :user_name
  end
end
