FactoryBot.define do
  factory :order do
    order_number {rand(999)}
    total {rand(999)}
    state { 0 }
  end
end
