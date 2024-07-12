FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example.com' }
    password              { '000000' }
    password_confirmation { '000000' }
    last_name { '田中' }
    first_name { '太郎' }
    last_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birthday { '1990-01-01' }
  end
end