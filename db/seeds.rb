# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(first_name:"Jimi", last_name: "Hendrix", email: "jhendrix@gmail.com", password: "abcdef", avatar: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/hendrix.jpg')))
user2 = User.create!(first_name:"Joe", last_name: "Smith", email: "joesmith@gmail.com", password: "abcdef", avatar: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/maleAvatar.png')))
user3 = User.create!(first_name:"Ozzy", last_name: "Osbourne", email: "ozzy@gmail.com", password: "abcdef", avatar: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/ozzy.jpg')))
user4 = User.create!(first_name:"Zack", last_name: "Wylde", email: "Wylde@gmail.com", password: "abcdef", avatar: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/zackwylde.jpg')))

#user1.save
user1.posts.create!(title: "Purple Hays all in my brain", content: "Lately things don't seem the same. Actin funny but I don't know why...", longitude: 33.33, latitude: 33.33, image: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/purplehays.jpeg')))
user2.posts.create!(title: "Got a new kitten", content: "It it so cute", longitude: 33.33, latitude: 32.33, image: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/kitten.jpeg')))
user3.posts.create!(title: "Teaching a crow to eat out of my mouth", content: "It bit my tongue", longitude: 33.33, latitude: 32.33, image: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/ozzyCrow.jpg')))
user3.posts.create!(title: "New pet rat", content: "Most badass rat ever", longitude: 33.33, latitude: 32.33, image: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/ozzyRat.jpg')))
user4.posts.create!(title: "New guitar model released", content: "The Odin with bullseye design", longitude: 33.33, latitude: 32.33, image: File.open(File.join(Rails.root, 'http://s3.amazonaws.com/maja-fc-photobucket/zackGuitar.jpg')))


http://s3.amazonaws.com/maja-fc-photobucket/f

#user1.posts.save
#user1.save
