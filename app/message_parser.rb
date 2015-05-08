class MessageParser
  def initialize
    @headers = ["date_of_message", "timestamp_of_message", "sender_of_message", "phone_number_of_message", "message_text"]
    @path = '/Users/jonathanwarrick/Desktop/Viber messages/'
  end

  def parse_messages
  	Dir.glob("#{@path}*.CSV").each_with_index do |file, index|
  	  csv_text = File.read(file, :encoding => 'utf-16le', :mode => 'rb')
  	  File.open('/tmp/tmp_file', 'w') { |tmp_file| tmp_file.write(csv_text.encode('utf-8')) }
  	  SmarterCSV.process('/tmp/tmp_file', {
  	    :file_encoding => 'utf-8',
  	    :col_sep => "\t",
  	    :force_simple_split => true,
  	    :headers_in_file => false,
  	    :user_provided_headers => @headers
  	   }).each do |row|
        user          = {}
  	    message = {}
        room          = {}
  	    
        message[:date_of_message] = Date.parse(row[:date_of_message][2..-2])
  	    message[:timestamp_of_message] = row[:timestamp_of_message]
  	    message[:message_text] = row[:message_text][1..-2]
        
        user[:name] = row[:sender_of_message][2..-2]
        user[:phone_number] = row[:phone_number_of_message][3..-2]
  	    
        room[:room_name] = file.gsub(@path, '')
  	    
        current_user = User.where(:phone_number => user[:phone_number]).first_or_create(user)
        # if User.find_by_phone_number(user[:phone_number]).nil?
        #   User.create!(user)
        # end

        current_room = Room.where(:room_name => room[:room_name]).first_or_create(room)
        # if Room.find_by_room_name(room[:room_name]).nil?
        #   Room.create!(room)
        # end

        message[:room_id] = current_room.id

        current_user.viber_messages.create!(message)
  	  end
  	end
  end
end