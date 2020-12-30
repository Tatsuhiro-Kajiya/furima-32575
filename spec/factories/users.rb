FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@gmail.com"}
    password              {"a12345"}
    encrypted_password    {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-01-01"}
  end
end