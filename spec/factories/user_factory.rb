FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user do
		email
		password "12345678"
		first_name "Albert"
		last_name "Ott"
		admin false
	end

	factory :admin_user, parent: :user do
		admin true
	end
end