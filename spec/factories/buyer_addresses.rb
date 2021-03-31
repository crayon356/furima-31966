FactoryBot.define do
  factory :buyer_address do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   {"123-1096"}
    city          {"港区"}
    address       {"台場2-11-33"}
    building      {"フジテレビ"}
    telephone     {17098765432}
    province_id   {10}
    user_id       {4}
    item_id       {20}
  end
end
