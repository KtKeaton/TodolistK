class AddUserIdToTask < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :user_id, :integer
  end
end
