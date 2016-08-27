FactoryGirl.define do
  factory :event_group do
    name 'Awesome event'
    description 'Ruby on Rails training'
    location 'Ho Chi Minh city'
    status 0
    start_time Time.current
    end_time Time.current + 1.days
  end

  factory :user do
    name 'Long Nguyen'
    email 'long.polyglot@gmail.com'
  end
end
