class AddDefaultToStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :status, :integer, limit: 2, default: 0
  end
end
