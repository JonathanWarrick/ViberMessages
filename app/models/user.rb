class User < ActiveRecord::Base
	has_many :viber_messages
end
