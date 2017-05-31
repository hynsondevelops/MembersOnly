module SessionsHelper
	def sign_in(user)
		new_token = User.new_remember_token
		cookies.permanent[:remember_token] = new_token
		user.update_attribute(:remember_token, User.digest(new_token))
		self.current_user = user
	end

	def signed_in?
		if (cookies[:remember_token] != nil)
			return true
		else
			return false
		end
	end

	def current_user
		@current_user ||= User.find_by(remember_token: User.digest(cookies[:remember_token]))
	end

	def current_user=(user)
		@current_user = user
	end

	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
