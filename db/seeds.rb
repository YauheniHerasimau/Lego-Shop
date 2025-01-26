categories = [ "Lego Star Wars", "Lego Technic", "Lego City", "Lego Friends", "Lego Ninjago", "Lego Creator", "Lego Duplo", "Lego Architecture", "Lego Marvel Super Heroes", "Lego Harry Potter" ]
categories.each { |name| Category.create!(name: name) }

User.create!(email: "milko.gera@gmail.com", password: "14886663", admin: true)
User.create!(email: "user@example.com", password: "password")
User.create!(email: "user2@example.com", password: "password")
User.create!(email: "user3@example.com", password: "password")

legos = [
  {
    name: "Millennium Falcon",
    description: "The Millennium Falcon is a fictional starship in the Star Wars universe.",
    lego_set: "Lego Star Wars",
    image_url: "https://www.lego.com/pl-pl/product/millennium-falcon-75257",
    details: 1000,
    price: 799.99
  },
  {
    name: "Death Star",
    description: "The Death Star is a fictional moon-sized space station in the Star Wars universe.",
    lego_set: "Lego Star Wars",
    image_url: "/death.jpg",
    details: 2000,
    price: 1499.99
  },
  {
    name: "BMW M3 E46",
    description: "The BMW M3 E46 is a high-performance sports car produced by BMW.",
    lego_set: "Lego Technic",
    image_url: "https://www.lego.com/pl-pl/product/bmw-m4-gt3-bmw-m-hybrid-v8-race-cars-76922",
    details: 3000,
    price: 299.99
  },
  {
    name: "Alfa Romeo GT Coupe",
    description: "The Alfa Romeo GT Coupe is a sports car produced by Alfa Romeo.",
    lego_set: "Lego Technic",
    image_url: "https://www.lego.com/pl-pl/product/belle-s-storytime-horse-carriage-43233",
    details: 950,
    price: 199.99
  },
  {
    name: "Tesla Model S",
    description: "The Tesla Model S is an electric car produced by Tesla.",
    lego_set: "Lego Technic",
    image_url: "https://www.lego.com/pl-pl/product/neom-mclaren-formula-e-race-car-42169",
    details: 1500,
    price: 249.99
  },
  {
    name: "Lord of the Rings",
    description: "The Lord of the Rings is a fantasy novel written by J.R.R. Tolkien.",
    lego_set: "Lego Creator",
    image_url: "https://www.lego.com/pl-pl/product/the-lord-of-the-rings-barad-dur-10333",
    details: 1200,
    price: 199.99
  },
  {
    name: "Harry Potter",
    description: "Harry Potter is a series of fantasy novels written by J.K. Rowling.",
    lego_set: "Lego Harry Potter",
    image_url: "https://www.lego.com/pl-pl/product/harry-potter-and-the-deathly-hallows-part-2-76113",
    details: 1800,
    price: 299.99
  }
]

legos.each do |lego_attributes|
  lego = Lego.create!(lego_attributes)
  if category = Category.find_by(name: lego.lego_set)
    LegoCategory.create!(lego: lego, category: category)
  end
end
