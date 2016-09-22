class SessionsController < ApplicationController
  def new
  end

  def show
  	@user = User.find(session[:user_id])
  end

  def edit
  	@user = User.find(session[:user_id])
  end

  def create
  	user = User.find_by(name: params[:session][:name])
  	if user && (user.password == params[:session][:password])
  		session[:user_id] = user.id
  		redirect_to root_path
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def update
	@user = User.find(session[:user_id])

	if @user.update(user_params)
		redirect_to user_profile_path
	else
		render 'edit'
	end
  end

  def destroy
  end

  private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end
