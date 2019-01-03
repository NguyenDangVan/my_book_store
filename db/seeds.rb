User.create! name: "Admin",
             email: "admin@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             role: 1

User.create! name: "Dang Van", email: "dinvvan@gmail.com",
  password: "123456", password_confirmation: "123456", role: 2

30.times do |n|
  name = FFaker::Name.name
  phone = "03" + "#{rand(10000000..19999999)}"
  User.create! name: name,
               email: "user_#{n+1}@email.com",
               address: "Ha Noi" + "#{n+1}",
               phone: phone,
               password: "123123",
               password_confirmation: "123123",
               role: 0
end

10.times do |n|
  Category.create! name: FFaker::Book.unique.genre,
    description: FFaker::Lorem.paragraph(5)
end
