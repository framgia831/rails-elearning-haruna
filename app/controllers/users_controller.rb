class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user =	User.new(user_params)

		@user.image_name = "default_user.png"

		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render "new"
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	# def edit
	# 	@user = User.find_by(id: params[:id])
	# end

	# def update
	# 	@user = User.find(params[:id])
	# 	@user.update(user_params)

	# 	if params[:image]
	# 		@user.image_name = "#{user.id}.jpg"
	# 		image_name = params[:image]
	# 		File.binwrite("app/assets/images/user_images/#{user.image_name}", image.read)
	# 	end

	# 	redirect_to root_path
	# end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name)
		end

end
