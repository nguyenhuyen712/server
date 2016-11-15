Admin.create! name: "Admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456"

User.create! name: "Customer", email: "customer@gmail.com",
  phone: "0123456789", gender: 1 , blood_group: "A"

user = User.last
user.accidents.create! latitude: 24, longitude: 324
