class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :username
      t.string :seat
      t.timestamps
    end
  end
end
