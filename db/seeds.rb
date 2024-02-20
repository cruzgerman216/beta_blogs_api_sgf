user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", username: "test", password: "password", password_confirmation: "password")

10.times do |i| 
  user.blogs.create(title: "Title #{i}", content: "Content #{i}")
end