class ViberMessagesController < ApplicationController
	def index
		@message_counts = User.all.map{|user| [user.name, user.viber_messages.where(:room_id => Room.find_by_room_name("Anything but FF, including E - messages.CSV").id).count] }.select{|x| x[1] > 0}
	end
end
