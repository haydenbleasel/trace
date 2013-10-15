class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
 		@user = User.new(user_params)
		if @user.save	
  			redirect_to @user
  		else
  			render 'new'
  		end
	end
	def show
		@user = User.find(params[:id])
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])

		if @user.update(params[:user].permit(:name, :email, :date_of_birth, :username, :password, :date_joined))
			redirect_to @user
		else
			render 'edit'
		end
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path #check if you can reuse code
	end
	private
  		def user_params
    		params.require(:user).permit(:name, :email, :date_of_birth, :username, :password, :date_joined)
  		end

end