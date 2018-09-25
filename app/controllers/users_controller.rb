class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create, :index]
	before_action :correct_user, only: [:edit, :update]

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

	def followers
		@user = User.find(params[:id])
		@users = @user.followers.page(params[:page]).per(8)
	end

	def following
		@user = User.find(params[:id])
		@users = @user.following.page(params[:page]).per(8)
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

    def correct_user
    	@user = User.find(params[:id])

    	unless @user == current_user
    		flash[:notice] = "Invalid access."
    		redirect_to user_path(@user)
    	end
    end

end
