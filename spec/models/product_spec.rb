require 'rails_helper'

describe Product do
	context 'when the product has comments' do
		before do
			@product = Product.create!(name: "race bike")

			@user = User.create!(
				first_name: "Albert",
				last_name: "Ott",
				email: "test@test.de",
				password: "12345678"
			)
			
			@product.comments.create!(
				rating: 1,
				user: @user,
				body: "Awful bike!"
			)

			@product.comments.create!(
				rating: 3,
				user: @user,
				body: "ok bike!"
			)

			@product.comments.create!(
				rating: 5,
				user: @user,
				body: "fantastic bike!"
			)
		end

		it "returns the average rating of all the comments" do
			expect(@product.average_rating).to eq(3)
		end

		it "is not valid" do
			expect(Product.new(description: "Nice bike")).not_to be_valid
		end
	end
end