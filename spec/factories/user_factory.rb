FactoryGirl.define do
  factory :user_admin, class: User do
    email 'admin@servidor.com'
    password '1PasteldeLimon2'
    admin true
  end

  factory :user_not_admin, class: User do
    email 'admin2@servidor.com'
    password '1PasteldeLimon2'
    admin false
  end
end
