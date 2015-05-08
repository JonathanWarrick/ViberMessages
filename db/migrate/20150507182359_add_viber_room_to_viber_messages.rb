class AddViberRoomToViberMessages < ActiveRecord::Migration
  def change
    add_column :viber_messages, :viber_room, :string
  end
end
