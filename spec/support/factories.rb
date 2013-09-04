FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com" }
    password 'testtest'
    admin true
  end

  factory :highlight_type do
  	name 'Basic'
  	description 'Just the basics'
  	price '1500'
    active true
  end

  factory :highlight do
    name 'Joe'
    highlight_type
    user
  end

end