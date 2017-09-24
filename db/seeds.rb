50.times do
  Voter.create([{
    name: Faker::Name.name,
    age: Faker::Number.number(2),
    location: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    date_last_contacted: Faker::Date.backward(3000)
  }])
end
