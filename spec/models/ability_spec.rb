require 'rails_helper'
require 'cancan/matchers'

describe Ability do
	before do
		@user = User.create!(
  		first_name: 'Albert',
  		last_name: 'Ott',
  		email: 'test@test.com',
  		password: 'password'
  	)

	  @ability = Ability.new(@user)
	end

	context "when the user owns the comment" do
		before do
	  	@comment = Comment.new(user: @user)
	 	end

	 	it 'can destroy the comment' do
	  	expect(@ability).to be_able_to(:destroy, @comment)
	  end
	end

	context 'when the user does not own the comment' do
		before do
	  	@comment = Comment.new
		end

		it 'cannot destroy the comment' do
			expect(@ability).not_to be_able_to(:destroy, @comment)
		end
	end

	context 'when the user owns the account' do

	 	it 'can manage the account' do
	 		expect(@ability).to be_able_to(:manage, @user)
	 	end
	end

	context 'when the user does not owns the account' do
		before do
	  	@user = User.new
		end

	 	it 'can not manage the account' do 
	 		expect(@ability).not_to be_able_to(:manage, @user)
	 	end
	end

	context 'when the user is not an admin' do 

		it 'can just read everything' do
			expect(@ability).to be_able_to(:read, [Product, Comment])
	 	end
	end

	context 'when the user is an admin' do
		before do
			@user = User.new(:admin => true)
			@ability = Ability.new(@user)
		end

		it 'can manage all' do
			expect(@ability).to be_able_to(:manage, :all)
	 	end
	end

	context 'when the user does create a new product' do
		before do
	  	@product = Product.new
		end

		it 'can create a new product' do
			expect(@ability).to be_able_to(:create, @product)
		end
	end

	context 'when the user does create a new comment' do
		before do
	  	@comment = Comment.new
		end

		it 'can create a new comment' do
			expect(@ability).to be_able_to(:create, @comment)
		end
	end

	context 'when the user wants to update a product' do
		before do
	  	@product = Product.new
		end

		it 'can update the product' do
			expect(@ability).to be_able_to(:update, @product)
		end
	end
end