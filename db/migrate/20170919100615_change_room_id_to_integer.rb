class ChangeRoomIdToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :seats, :room_id, :integer
  end
end
