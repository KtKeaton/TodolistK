class RedoUserRole < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_role, :integer
  end
end
