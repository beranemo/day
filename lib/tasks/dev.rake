namespace :dev do
  task fake: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: "restaurant#{i.to_s}",
        opening_hours: "11:00",
        tel: "02-1234-5678",
        address: "my_address",
        description: "description of the restaurant"
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
end
