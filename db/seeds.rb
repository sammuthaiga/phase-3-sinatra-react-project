puts "🌱 Seeding spices..."

# Seed your database here

# Create a plumber instance
plumber1 = Plumber.create(
    name: "Mike Davis",
    image_url: "https://rb.gy/lhjw06",
    task: "Commercial plumber",
    description: "Perform plumbing duties in commercial settings.",
    phone_number: "0710345675",
    location: "Nairobi, Lavington",
    star_rating: 9,
    comment: "We all know him !",
    datetime: "01/02/2023"
)


# create user instance
user1 = User.create(
    Fullname: "John Smith",
    image_url: "https://rb.gy/efxhme",
    email: "john@example.com ",
    phone_number: "0756454322",
    task: "Commercial plumber",
    description: "Set up and maintenance",
    star_rating: 10,
    comment: "Great deal!",
    feedback: "Looking for an experienced plumber.",
)

# create service instance
user1 = Service.create(
    user_id: user1.id,
    plumber_id: plumber1.id
)

puts "✅ Done seeding!"
