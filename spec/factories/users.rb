FactoryBot.define do
  factory :user do
    email 'test@example.com'
    encrypted_password '$2a$11$p3yWmpsMuP0dDJ2/8zOZZ.MUPJt2rAxgbejULXGe.oTqVnjMsQeOG'
    permission_level 3
  end

  factory :random_user, class: User do
    email { Faker::Internet.unique.safe_email}
    encrypted_password { Faker::Internet.password(60,60)}
    permission_level 3
  end

end