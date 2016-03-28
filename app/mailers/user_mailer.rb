class UserMailer < ApplicationMailer
	default from: "julia.ott@me.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'kindergabel@gmail.com',
			:subject => "A new contact form message from #{name}")
	end

	def welcome(user)
		@appname = "Bike Shop Berlin"
		mail( :to => user.email,
					:subject => "Welcome to #{@appname}!")
	end
end
