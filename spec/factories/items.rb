FactoryBot.define do
  factory :item do
    name            {'スマートフォン'}
    category_id     {3}
    state_id        {10}
    province_id     {2}
    souryou_id      {1}
    day_id          {2}
    price           {'10000'}
    comment         {Faker::Lorem.sentence}
    #image           {Faker::Lorem.sentence}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
