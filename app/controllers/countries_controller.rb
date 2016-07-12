class CountriesController < ApplicationController
	before_action :require_user, only: [:index, :show]
	before_action :require_editor, only: [:edit, :new]
	before_action :require_admin, only: [:destroy]

	def index
		@countries = Country.all
	end

	def show
		@country = Country.find(params[:id])
		@tags = @country.tags
	end

	def new
		@country = Country.new
	end


	def create
		t = Time.now.strftime("%Y%m%d%H%M%S")
		uploaded_io = params[:country][:image]
        File.open(Rails.root.join('public', 'uploads', 'countries', uploaded_io.original_filename), 'wb') do |file|
     	file.write(uploaded_io.read)
        end

		@country = Country.new(country_params)
		if @country.save
			redirect_to "/countries", notice: "Country created successfully!"
		else
			redirect_to root_path, error: "Country was not created."
		end
	end

	def edit
		@country = Country.find(params[:id])
	end

	def update
		@country = Country.find(params[:id])
		if @country.update_attributes(country_params)
			redirect_to "/countries", notice: "Country updated successfully"
		else
			render "edit", error: "Country has not been updated."
		end
	end


	def destroy
		@country = Country.find(params[:id])
		@country.destroy
		redirect_to "/countries", notice: "Country destroyed successfully!"
	end

	def upload
            uploaded_io = country_params
            File.open(Rails.root.join('public', 'uploads', 'countries', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
            end
    end

	private

	def country_params
		params.require(:country).permit(:title,:image)
	end
end
