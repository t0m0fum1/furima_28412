FactoryBot.define do
  factory :item do
    name                    { 'カメラ' }
    explain                 { '長年使用したので、安くしてあります。' }
    category_id             { '2' }
    status_id               { '2' }
    burden_id               { '2' }
    shipping_origin_id      { '2' }
    day_id                  { '2' }
    fee                     { '1000' }

    association :user

    after(:build) { |item| item.image.attach(io: File.open(Rails.root.join('public', 'images', 'camera.png')), filename: 'camera.png', content_type: 'image/png') }

    # trait :with_image do
    #   after(:build) { |item| item.image.attach(io: File.open(Rails.root.join('public', 'images', 'camera.png')), filename: 'camera.png', content_type: 'image/png') }
    # end
  end
end
