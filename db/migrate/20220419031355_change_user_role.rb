class ChangeUserRole < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_role,  'boolean USING CAST(user_role AS boolean)'
  end
end
