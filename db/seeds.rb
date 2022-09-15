puts "🌱 Seeding spices..."
Station.create(name: "Matungu")
Station.create(name: "Mumias")
Station.create(name: "Harambee")
Voter.create(name: "Wamaya", station_id: 1)
Voter.create(name: "John", station_id: 1)
Voter.create(name: "Auma", station_id: 1)
Voter.create(name: "Mercy", station_id: 2)
Voter.create(name: "Faith", station_id: 2)

# Seed your database here

puts "✅ Done seeding!"
