class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email])

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "Sucessfully logged in!"
			redirect_to user_path(user)
		else
			flash[:notice] = "Invalid information."
			render "new"
		end
	end

end
