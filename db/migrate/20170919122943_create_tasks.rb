class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :username
      t.string :password
      t.string :start
      t.string :end
      t.integer :seat
      t.string :remark
    end
  end
end
