class AddUserIdToViberMessages < ActiveRecord::Migration
  def change
    add_column :viber_messages, :user_id, :integer
  end
end
