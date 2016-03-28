FactoryGirl.define do

	factory :comment do
		body "some description text"
		product
		user
	end
end