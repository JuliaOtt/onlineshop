require 'rails_helper'

describe UserRegistrationsController, :type => :controller do
	describe 'POST :create' do
		before do
			@request.env["devise.mapping"] = Devise.mappings[:user]
		end

		context 'with valid parameters' do
			before do
				post(:create, user: {
					first_name: "Albert",
					last_name: "Ott",
					email: "kindergabel@gmail.com",
					password: "12345678"
				})
			end

			it 'persists the user' do
				users = User.where(
					first_name: 'Albert',
					last_name: 'Ott',
					email: 'kindergabel@gmail.com'
				)

				expect(users.count).to eq(1)
			end

			it 'delivers a welcome email' do
				expect(ActionMailer::Base.deliveries.length).to eq(1)
			end
		end

		context 'with invalid parameters' do
			before do
				post :create, user: { email: 'kindergabel@gmail.com' }
			end

			it 'does not persist the user' do
				expect(User.count).to eq(0)
			end

			it 'does not deliver a welcome email' do
				expect(ActionMailer::Base.deliveries.length).to eq(0)
			end
		end
	end
end