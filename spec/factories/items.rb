FactoryBot.define do
  factory :item do
    title {"テスト"}
    description {"テストデータです"}
    price {12000}
    category_id {675}
    condition_id {1}
    prefecture_id {2}
    shipping_fee_burden_id {2}
    shipping_method_id {2}
    shipping_duration_id {2}
    user_id {2}
    created_at {2019/11/11}
    updated_at {2019/11/15}   
  end
end
