namespace :dev do
  task fake_restaurants: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
        name: "restaurant#{i.to_s}",
        opening_hours: "11:00",
        tel: "02-1234-5678",
        address: "my_address",
        description: "description of the restaurant",
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end
  
  task fake_all: :environment do
    Rake::Task['db:drop'].execute
    Rake::Task['db:create'].execute
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_restaurants'].execute
  end
  
end
