class EditDueDate < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :due_date, :datetime, precision: 6
  end
end
