class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.text :infomation
      t.timestamps
    end
  end
end
