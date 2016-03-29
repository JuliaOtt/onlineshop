class PaymentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		token = params[:stripeToken]
		@product = Product.find(params[:product_id])
		@user = current_user

		begin
			charge = Stripe::Charge.create(
				amount: @product.price_in_cents,
				currency: 'eur',
				source: token,
				description: @product.name
			)

			if charge.paid
				Order.create(
					product: @product,
					user: @user,
					total: @product.price
				)
			end
		rescue Stripe::CardError => e
			# The card has been declined
		end
		redirect_to product_path(product),
			notice: 'Thank you! Your purchase has been successful.'
	end
end
