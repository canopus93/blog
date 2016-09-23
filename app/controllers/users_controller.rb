class UsersController < ApplicationController
	def index
		decorator = UsersDecorator.new(self)
		@users = decorator.decorate_for_index(User.all)
	end

	def show
		decorator = UsersDecorator.new(self)
		@user = decorator.decorate_for_show(User.find(params[:id]))
	end

	def new
		@user = User.new
		
	end

	def edit
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password)
		end
end
