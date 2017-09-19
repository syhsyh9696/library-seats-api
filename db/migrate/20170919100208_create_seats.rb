class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.string :seat_id
      t.string :seat_name
      t.integer :room_id
    end
  end
end
