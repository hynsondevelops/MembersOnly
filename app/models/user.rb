class User < ApplicationRecord
	#attr_accessor :name, :email
	before_save  :downcase_email 
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: {minimum: 8, maximum: 15}
	validates :password_confirmation, presence:true, length: {minimum: 8, maximum: 15}
	has_secure_password


	def User.digest(token)
	    Digest::SHA1.hexdigest(token.to_s)
	end

	def User.new_remember_token
	   SecureRandom.urlsafe_base64
	 end
	 
	private

	    # Converts email to all lower-case.
	    def downcase_email
	      self.email = email.downcase
	    end

	    def create_remember_token
	      self.remember_token = User.digest(User.new_remember_token)
	    end

end
