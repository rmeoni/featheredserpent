class ApplicationController < ActionController::Base 	
	helper_method :current_user
	helper_method :message


	protect_from_forgery with: :exception
	
	def current_user
	@current_user ||= User.find(session[:user_id]) if session[:user_id] 
	end

	def require_user
	 unless current_user
	 	flash[:error] = "Oops! You must be logged in to access this section."
	 	redirect_to '/login'
	 end
	end

	def require_editor
	 unless current_user.editor? || current_user.admin?
	 	flash[:error] = "Oops! You don't have permissions to access this section."
	 	redirect_to '/'
	 end
	end

	def require_admin
		unless current_user.admin?
			flash[:error] = "Oops! You don't have permissions to access this section."
			redirect_to '/'
		end
	end

	def require_super
		unless current_user.super?
			flash[:error] = "Oops! You don't have permissions to access this section."
			redirect_to '/'
		end
	end

	def user
		@user = User.find(params[:id])
	end

	def require_owner
		unless  
			current_user.super? || current_user.id == user.id
			redirect_to '/'
		end 
	end

	def current_country
		@current_country = find(params[:country_id])
	end

 # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

end
