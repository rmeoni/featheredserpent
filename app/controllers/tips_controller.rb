class TipsController < ApplicationController
	def index
		@tips = Tip.all
	end

	def new
		@tip = Tip.new
	end

	def create
		@tip = Tip.new(tip_params)
		@tip.user_id = current_user.id
		if @tip.save
			redirect_to "/tips"
		else
			render "new"
		end
	end

	def edit
		@tip = Tip.find(params[:id])
	end

	def update
		@tip = Tip.find(params[:id])
		if 

			@tip.update_attributes(tip_params)
			redirect_to '/tips', notice: 'Tip updated successfully'
		else
			render 'edit'
		end
	end

	def destroy
		@tip = Tip.find(params[:id])
		@tip.destroy
		redirect_to '/tips', alert: 'Tip destroyed successfully'
	end

	private
	def tip_params
		params.require(:tip).permit(:content, :user_id)
	end
end
