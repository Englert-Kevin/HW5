class SessionsController < ApplicationController

	def new

	end

	def destroy
		session[:user_id] = nil
		redirect_to users_path
	end

	def create
		@user = User.where(fname: params[:fname]).first
		if @user && @user.email == params[:email]
			session[:user_id] = @user.id
			flash[:notice] = 'Login Successful'
			redirect_to users_path
		else
			flash[:alert] = 'Login Failed'
			redirect_to new_session_path
		end
	end
end