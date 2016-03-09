require 'rails_helper'

describe User do
	describe '#valid?' do
		before do
			@required_attributes = {
				first_name: 'Albert',
				last_name: 'Ott',
				email: 'test@test.com',
  			password: 'password'
			}
		end

		context 'when it has no first name' do
			before do
				@user = User.new(@required_attributes.except(:first_name))
			end

			it 'is false' do
				expect(@user).not_to be_valid
			end
		end

		context 'when it has no last name' do
			before do
				@user = User.new(@required_attributes.except(:last_name))
			end

			it 'is flase' do
				expect(@user).not_to be_valid
			end
		end

		context 'when it has all required attributes' do
			before do
				@user = User.new(@required_attributes)
			end
		
			it 'is true' do
				expect(@user).to be_valid
			end
		end
	end
end