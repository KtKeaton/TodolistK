class Edit2DueDate < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :due_date, :timestamp, precision: 6
  end
end
