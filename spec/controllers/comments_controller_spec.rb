require 'rails_helper'

describe CommentsController, :type => :controller do
	before do
		@user = User.create!(
			first_name: "Albert",
			last_name: "Ott",
			email: "test@test.de",
			password: "12345678"
		)

		@product = Product.create!(
			name: "red racing bike"
			)
	end


	describe 'POST #create' do
		context 'when the user is signed in' do
			before do
				sign_in @user

				post :create, 
					product_id: @product.id,
					comment: {
						body:"Some text about the stuff",
						rating:4
					}
			end

			it 'should create a comment' do
				expect(Comment.count).to eq(1)
			end

			it 'redirects to the product show page' do
				expect(response).to redirect_to(product_path(@product))
			end
		end
	end
end