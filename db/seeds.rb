require 'httparty'

# Clears the table
Review.destroy_all
Breed.destroy_all
Group.destroy_all

# 
GROUP_NAMES = [
  "Herding", "Sporting", "Toy", "Working",
  "Terrier", "Hound", "Non-Sporting"
]

GROUP_NAMES.each do |name|
  Group.create!(name: name)
end

puts "Created #{Group.count} groups"

response = HTTParty.get("https://dog.ceo/api/breeds/list/all")
breed_names = response["message"].keys

breed_names.each do |breed_name|
  image_response = HTTParty.get("https://dog.ceo/api/breed/#{breed_name}/images/random")
  image_url = image_response["message"]

  Breed.create!(
    name: breed_name.capitalize,
    image_url: image_url,
    group: Group.all.sample
  )
end

puts "Created #{Breed.count} breeds"

COMMENTS = [
  "Great with kids and very patient.",
  "Needs a lot of exercise but worth it.",
  "Sheds more than I expected.",
  "Learns new tricks in a couple of days.",
  "Barks at everything that moves.",
  "Perfect apartment dog, very quiet.",
  "Loves the water and long walks.",
  "Stubborn during training but sweet.",
  "Very affectionate, follows me everywhere.",
  "Grooming takes time, but the coat is beautiful."
]

Breed.all.each do |breed|
  rand(2..4).times do
    Review.create!(
      reviewer_name: Faker::Name.first_name,
      rating: rand(1..5),
      comment: COMMENTS.sample,
      playfulness: rand(1..5),
      affection: rand(1..5),
      ease_of_care: rand(1..5),
      breed: breed
    )
  end
end

puts "Created #{Review.count} reviews"