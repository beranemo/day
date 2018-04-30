# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Category

Category.destroy_all

category_list = [
  { name: "中式料理" },
  { name: "日本料理" },
  { name: "義大利料理" },
  { name: "墨西哥料理" },
  { name: "素食料理" },
  { name: "美式料理" },
  { name: "複合式料理" }
]

category_list.each do |category|
  Category.create(name: category[:name])
end
puts "Category created!"

# Default admin

User.create(email: "root@example.com", password: "12345678", role: "admin")
puts "Default admin created!"
