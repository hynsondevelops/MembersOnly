class SessionsController < ApplicationController
	def create
		currentUser = User.find_by(email: params[:session][:email].downcase)
		if (currentUser.authenticate(params[:session][:password]))
			sign_in(currentUser)
		end
		redirect_to posts_url
	end
	def destroy
		sign_out
		redirect_to signin_path
	end
end
