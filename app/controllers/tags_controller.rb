class TagsController < ApplicationController
	before_action :require_user, only: [:index, :show]
	before_action :require_editor, only: [:edit, :new]
	before_action :require_admin, only: [:destroy]


	def index
	 @tags = Tag.all
	end
	
	def show
	 @tag = Tag.find(params[:id])
	 @destinations = @tag.destinations	
	end
	
	def new
		@tag = Tag.new
	end

	def create
		t = Time.now.strftime("%Y%m%d%H%M%S")
		uploaded_io = params[:tag][:image]
        File.open(Rails.root.join('public', 'uploads', 'tags', uploaded_io.original_filename), 'wb') do |file|
     	file.write(uploaded_io.read)
        end

		@tag = Tag.new(tag_params)
		@tag.country_id = country_path(:id)
		if @tag.save
			redirect_to "/tags", notice: "Tag created successfully!"
		else
			redirect_to "/tags/new"

		end

	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		if @tag.update_attributes(tag_params)
		redirect_to "/tags", notice: "Tag updated successfully!"
		else
		render 'edit'
		end	
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		redirect_to "/tags", alert: "Tag destroyed successfully!"
	end

	private
	
	def tag_params
		params.require(:tag).permit(:title, :image, :country_id)
	end

end

