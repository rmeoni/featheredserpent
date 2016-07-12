class DestinationsController < ApplicationController
	before_action :require_user, only: [:show, :index]
	before_action :require_editor, only: [:edit, :update, :new]
	before_action :require_admin, only: [:destroy, :create]
	
	def index
		@destination = Destination.all
	end

	def show
		@destination = Destination.find(params[:id])
		@tips = @destination.tips
	end
	
	def edit
	 @destination = Destination.find(params[:id])
	end

	def update
	 @destination =Destination.find(params[:id])
	  if
	 @destination.update_attributes(destination_params)
		redirect_to @destination, notice: "Destination updated successfully."
	  else
		render 'edit'
	  end
	end

	def new
		@destination = Destination.new
	end

	def create
		t = Time.now.strftime("%Y%m%d%H%M%S")
		uploaded_io = params[:destination][:image]
        File.open(Rails.root.join('public', 'uploads', 'destinations', uploaded_io.original_filename), 'wb') do |file|
     	file.write(uploaded_io.read)
        end

		@destination = Destination.new(destination_params)
		@destination.tag_id = tag_id
		if @destination.save
			redirect_to "/tags", notice: "Destination created successfully!"
		else
			redirect_to edit_destination_path, error: "Destination could not be created."

		end
	end

	def destroy
		@destination = Destination.find(params[:id])
		@destination.destroy
		redirect_to "/tags", alert: "Destination destroyed succesfully."
	end

	def message
		@message = Message.new
	end

	def messages
		@messages = Message.all
	end

	private
	
	def destination_params
	params.require(:destination).permit(:name, :description, :image, :tag_id)
	 end
	end
