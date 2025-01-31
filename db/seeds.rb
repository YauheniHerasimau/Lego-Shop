categories = [ "Lego Star Wars", "Lego Technic", "Lego City", "Lego Friends", "Lego Ninjago", "Lego Creator", "Lego Duplo", "Lego Architecture", "Lego Marvel Super Heroes", "Lego Harry Potter" ]
categories.each do |name|
  Category.find_or_create_by!(name: name)
end

User.find_or_create_by!(email: "milko.gera@gmail.com") do |user|
  user.password = "14886663"
  user.admin = true
end

User.find_or_create_by!(email: "user@example.com") do |user|
  user.password = "password"
end

User.find_or_create_by!(email: "user2@example.com") do |user|
  user.password = "password"
end

User.find_or_create_by!(email: "user3@example.com") do |user|
  user.password = "password"
end


legos = [
  {
    name: "Millennium Falcon",
    description: "The Millennium Falcon is a fictional starship in the Star Wars universe.",
    image_url: "falcon.jpg",
    details: 1000,
    price: 799.99,
    category_ids: [
      Category.find_by(name: "Lego Star Wars").id,
      Category.find_by(name: "Lego Technic").id
    ]
  },
  {
    name: "Death Star",
    description: "The Death Star is a fictional moon-sized space station in the Star Wars universe.",
    image_url: "death.jpg",
    details: 2000,
    price: 1499.99,
    category_ids: [
      Category.find_by(name: "Lego Star Wars").id,
      Category.find_by(name: "Lego Creator").id
    ]
  },
  {
    name: "BMW M3 E46",
    description: "The BMW M3 E46 is a high-performance sports car produced by BMW.",
    image_url: "bmw.jpg",
    details: 3000,
    price: 299.99,
    category_ids: [
      Category.find_by(name: "Lego City").id,
      Category.find_by(name: "Lego Technic").id
    ]
  },
  {
    name: "Alfa Romeo GT Coupe",
    description: "The Alfa Romeo GT Coupe is a sports car produced by Alfa Romeo.",
    image_url: "alfa.jpg",
    details: 950,
    price: 199.99,
    category_ids: [
      Category.find_by(name: "Lego Star Wars").id,
      Category.find_by(name: "Lego Technic").id
    ]
  },
  {
    name: "Tesla Model S",
    description: "The Tesla Model S is an electric car produced by Tesla.",
    image_url: "tesla.jpg",
    details: 1500,
    price: 249.99,
    category_ids: [
      Category.find_by(name: "Lego City").id,
      Category.find_by(name: "Lego Technic").id
    ]
  },
  {
    name: "Lord of the Rings",
    description: "The Lord of the Rings is a fantasy novel written by J.R.R. Tolkien.",
    image_url: "lotr.jpg",
    details: 1200,
    price: 199.99,
    category_ids: [
      Category.find_by(name: "Lego Creator").id
    ]
  },
  {
    name: "Harry Potter",
    description: "Harry Potter is a series of fantasy novels written by J.K. Rowling.",
    image_url: "harry.jpg",
    details: 1800,
    price: 299.99,
    category_ids: [
      Category.find_by(name: "Lego Harry Potter").id,
      Category.find_by(name: "Lego Creator").id
    ]
  }
]

legos.each do |lego_attributes|
  lego = Lego.create!(lego_attributes)
  if category = Category.find_by(name: lego.lego_set)
    lego.categories << category
  end
end
