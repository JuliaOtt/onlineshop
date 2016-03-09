require 'rails_helper'

describe Comment do
	describe '#valid?' do
		before do
			@required_attributes = {
				body: 'some body text',
				user: User.new,
				product: Product.new,
				rating: 5
			}
		end

		context 'when it has no body' do
			before do
				@comment = Comment.new(@required_attributes.except(:body))
			end

			it 'is false' do
				expect(@comment).not_to be_valid
			end
		end

		context 'when it has no user' do
			before do
				@comment = Comment.new(@required_attributes.except(:user))
			end

			it 'is flase' do
				expect(@comment).not_to be_valid
			end
		end

		context 'when it has all required attributes' do
			before do
				@comment = Comment.new(@required_attributes)
			end
		
			it 'is true' do
				expect(@comment).to be_valid
			end
		end
	end
end