if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe = {
		:publishable_key => 'pk_test_z88JGq9t2SwOyWHVIq02VjUK',
		:secret_key => 'sk_test_dp5fayEQZAn02qJHKWVLnj4O'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]