require 'rails_helper'

describe UsersController, :type => :controller do
	before do

		@user = FactoryGirl.create(:user)

		# @user = User.create!(
		# 	first_name: "Albert",
		# 	last_name: "Ott",
		# 	email: "test@test.de",
		# 	password: "12345678"
		# )
	end


	describe "GET #show" do
		context 'User is logged in' do
			before do
				sign_in @user
			end

			it 'loads correct user details' do
				get :show, id: @user.id
				expect(response.status).to eq(200)
				expect(assigns(:user)).to eq @user
			end
		end

		context 'No user is logged in' do
			it "redirects to login" do
				get :show, id: @user.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end

		context 'when user does not own the user profile' do
			before do
				@user_2 = User.create!(
					first_name: "Matthew",
					last_name: "Beedle",
					email: "test2@test2.de",
					password: "87654321"
				)
				sign_in @user_2
			end

			it "redirects to root path" do
				get :show, id: @user.id
				expect(response).to redirect_to(root_path)
			end
		end
	end
end