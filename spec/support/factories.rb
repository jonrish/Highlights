FactoryGirl.define do

  factory :user do
    sequence(:email) {|n| "test#{n}@test.com" }
    password 'testtest'
    admin true
  end

  factory :highlight_type do
  	name 'Basic'
  	description 'Just the basics'
  	price '19.99'
    active true
  end

end