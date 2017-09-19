class ChangeTasksRemarkFromStringToText < ActiveRecord::Migration[5.0]
  def change
    change_column :tasks, :remark, :text
  end
end
