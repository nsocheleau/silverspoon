Fabricator(:user) do
  email                 { sequence(:user_email) { |i| "user#{i}@test.net" } }
  password              "Welcome@123"
  password_confirmation "Welcome@123"
  confirmed_at          { Time.now }
end