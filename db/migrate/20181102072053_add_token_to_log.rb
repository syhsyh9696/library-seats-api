class AddTokenToLog < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :token, :string
  end
end
