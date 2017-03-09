User.where(email: "admin@example.com").destroy_all
User.where(email: "froveda@gmail.com").destroy_all
User.find_or_create_by_email("user@example.com", password: 'password')