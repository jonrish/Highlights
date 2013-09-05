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
    nickname "Joey"
    hometown 'Natick'
    school 'Boston College'
    previous_teams 'Eagles'
    bats 'right'
    throwing_hand 'right'
    position 'first base'
    age '99'
    family_friends 'matt, abby, becky, katie'
    opponent 'phillies'
    scenario 'homer wins it in the 10th'
    notes 'shot to dead center'
    state 'processing'
    highlight_type
    user
  end

end
