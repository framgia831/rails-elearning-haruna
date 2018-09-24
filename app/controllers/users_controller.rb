class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]

	def index
		@users = User.page(params[:page]).per(8)
	end

	def new
		@user = User.new
	end

	def create
		@user =	User.new(user_params)

		if @user.save
			log_in @user
			redirect_to home_path
		else
			render "new"
		end
	end

	def show
		@user = User.find_by(id: params[:id])
		@admin_user = User.find_by(admin: true)
		@activities = @user.activities.all.order(created_at: :desc).page(params[:page]).per(5)
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

    def require_login
      unless current_user
        flash[:notice] = "Please log in."
        redirect_to root_url
      end
    end

end
