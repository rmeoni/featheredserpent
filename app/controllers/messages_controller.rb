class MessagesController < ApplicationController

	helper_method :destination 
	
	def new
		@message= Message.new
	end

	def create
		@message = Message.new(message_params)
		@message.user_id = current_user.id
		@message.destination_id = :destination
		if @message.save
			redirect_to "/destinations"
		else
			flash.now[:error] = "error"
		end
	end

	private
	def message_params
		params.require(:message).permit(:content,:user_id, :destination_id)
	end
end
