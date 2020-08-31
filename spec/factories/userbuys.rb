FactoryBot.define do
  factory :user_buy do
    user_id { create(:user).id }
    item_id { create(:item).id }
    token { 'fagegebmdkamblamlkbrel' }
    postal_code { '123-4567' }
    prefecture_id { '2' }
    city { '岡崎市' }
    building_name { '柳ビル102' }
    address { '青山1-2-3' }
    tel { '00011112222' }
  end
end
