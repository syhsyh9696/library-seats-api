class AddRoomFloorAndSeats < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :floor, :integer
    add_column :rooms, :seats, :integer
  end
end
