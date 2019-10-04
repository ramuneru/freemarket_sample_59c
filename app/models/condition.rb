class Condition < ActiveHash::Base
  self.data = [
    {id: 1, condition: '新品、未使用'},{id: 2, condition: '未使用に近い'},{id: 3, condition: '目立った傷や汚れなし'},
    {id: 4, condition: 'やや傷や汚れあり'},{id: 5, condition: '傷や汚れあり'},{id: 6, condition: '全体的に状態が悪い'}
  ]
end

# @regions = Prefecture.all
# @conditions = Condition.all
# @shipping_fee_burdens = Shipping_fee_burden.all
# @shipping_methods = Shipping_method.all
# @shipping_durations = Shipping_duration.all