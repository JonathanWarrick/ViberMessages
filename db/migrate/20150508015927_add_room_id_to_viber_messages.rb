class AddRoomIdToViberMessages < ActiveRecord::Migration
  def change
    add_column :viber_messages, :room_id, :integer
  end
end
