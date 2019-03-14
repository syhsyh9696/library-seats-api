class ReconstructLogTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :token
    add_column :logs, :start_time, :string
    add_column :logs, :end_time, :string
  end
end
