puts "🌱 Seeding spices..."
Station.create(station: "Matungu")
Station.create(station: "Mumias")
Station.create(station: "Harambee")
Voter.create(voter: "Wamaya", station_id: 1)
Voter.create(voter: "John", station_id: 1)
Voter.create(voter: "Auma", station_id: 1)
Voter.create(voter: "Mercy", station_id: 2)
Voter.create(voter: "Faith", station_id: 2)

# Seed your database here

puts "✅ Done seeding!"
