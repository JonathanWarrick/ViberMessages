class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_name

      t.timestamps null: false
    end
  end
end
