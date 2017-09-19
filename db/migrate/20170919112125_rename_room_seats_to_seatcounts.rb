class RenameRoomSeatsToSeatcounts < ActiveRecord::Migration[5.0]
  def change
    rename_column :rooms, :seats, :seat_counts
  end
end
