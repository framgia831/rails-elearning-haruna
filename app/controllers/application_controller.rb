class ApplicationController < ActionController::Base
	include SessionsHelper

	def require_login
    unless current_user
      flash[:notice] = "Please log in."
      redirect_to root_url
    end
  end

  def correct_user
  	@user = User.find(params[:id])

  	unless @user == current_user
  		flash[:notice] = "Invalid access."
  		redirect_to user_path(@user)
  	end
  end

end
