class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user =	User.new(user_params)

		if @user.save
			log_in @user
			redirect_to user_path(@user)
		else
			render "new"
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		@admin_user = User.find_by(admin: true)
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)

    redirect_to user_path(@user)
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name)
		end

end
