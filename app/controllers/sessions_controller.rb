class SessionsController < ApplicationController
	def login
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:user][:email])

		if @user and @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
      		redirect_to root_path, flash: { success: 'Logged in successfully' }
		end
	end

	def logout
		session.delete(:user_id)

		redirect_to root_path, flash: { success: 'Logged out succesfully' }
	end
end
