class CreateViberMessages < ActiveRecord::Migration
  def change
    create_table :viber_messages do |t|
    	t.date     :date_of_message 
    	t.datetime :timestamp_of_message
    	t.string   :sender_of_message
    	t.string	 :phone_number_of_message
    	t.string   :message_text

      t.timestamps null: false
    end
  end
end
