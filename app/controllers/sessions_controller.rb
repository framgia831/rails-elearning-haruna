class SessionsController < ApplicationController
	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email])

		if user && user.authenticate(params[:session][:password])
			log_in user
			flash[:notice] = "Sucessfully logged in!"
			redirect_to user_path(user)
		else
			flash[:notice] = "Invalid information."
			render "new"
		end
	end

	def destroy
		session.delete(:user_id)

		redirect_to root_path
	end

end
