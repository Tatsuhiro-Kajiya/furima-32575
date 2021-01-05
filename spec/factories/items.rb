FactoryBot.define do
  factory :item do
    name                  {"testtest"}
    explanation           {"testtesttest"}
    category_id           {3}
    state_id              {3}
    shopping_cost_id      {3}
    prefecture_id         {3}
    shopping_days_id      {3}
    price_id             {2000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end