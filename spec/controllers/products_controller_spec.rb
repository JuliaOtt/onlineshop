require 'rails_helper'

describe ProductsController, :type => :controller do
	before do
		@user = User.create!(
			first_name: "Albert",
			last_name: "Ott",
			email: "test@test.de",
			password: "12345678"
		)
	end

	describe 'POST #create' do
		context 'with required parameters' do
			before do
				sign_in @user

				post(:create, {
					product: {
						name: 'test product',
						description: 'something'
					}
				})
			end

			it 'creates a product' do
				expect(Product.count).to eq(1)
			end

			it 'redirects to the product path' do
				expect(response).to redirect_to(product_path(Product.first))
			end
		end
	end
end