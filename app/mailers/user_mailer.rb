class UserMailer < ApplicationMailer
	default from: "julia.ott@me.com"

	def contact_form(email, name, message)
	@message = message
		mail(:from => email,
			:to => 'julia.ott@me.com',
			:subject => "A new contact form message from #{name}")
	end
end
