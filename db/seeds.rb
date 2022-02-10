3.times do |user|
  User.create!(
    email: "test#{user}@test.com",
    password: "123456",
    password_confirmation: "123456",
    name: "test#{user}"
  )
end

puts "3 users created"

Movie.create!(
  title: "The Lord of the Rings: The Fellowship of the Ring",
  description: "A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.",
  user_id: User.first.id
)

Movie.create!(
  title: "The Lord of the Rings: The Two Towers",
  description: "While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron's new ally, Saruman, and his hordes of Isengard.",
  user_id: User.first.id
)

Movie.create!(
  title: "The Lord of the Rings: The Return of the King",
  description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
  user_id: User.second.id
)


Movie.create!(
  title: "V for Vendetta",
  description: "In a future British tyranny, a shadowy freedom fighter, known only by the alias of 'V' plots to overthrow it with the help of a young woman.",
  user_id: User.second.id
)

Movie.create!(
  title: "The Matrix",
  description: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.",
  user_id: User.third.id
)

Movie.create!(
  title: "The Usual Suspects",
  description: "A sole survivor tells of the twisty events leading up to a horrific gun battle on a boat, which began when five criminals met at a seemingly random police lineup.",
  user_id: User.third.id
)

puts "6 movies created"