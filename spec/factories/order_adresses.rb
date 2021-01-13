FactoryBot.define do
  factory :order_address do
    postal_code       {"123-1234"}
    prefecture_id     {4}
    city              {"仙台市"}
    lot_number        {"仙台1-1"}
    building_number   {"仙台ハイツ"}
    phone_number      {"09012345678"}
    user_id           {1}
    item_id           {1}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end
