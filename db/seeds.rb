User.destroy_all
Genre.destroy_all
Show.destroy_all
Length.destroy_all


User.create(display_name: "User 1", username: "user 1", password: "user1")
User.create(display_name: "User 2", username: "user 2", password: "user2")
User.create(display_name: "User 3", username: "user 3", password: "user3")
User.create(display_name: "User 4", username: "user 4", password: "user4")

Genre.create(name: "Comedy")
Genre.create(name: "Horror")
Genre.create(name: "Thriller")
Genre.create(name: "Sitcom")
Genre.create(name: "Drama")
Genre.create(name: "Action")

Length.create(length_description: "20 mins")
Length.create(length_description: "30 mins")
Length.create(length_description: "1 hr")

user1show1 = Show.create(title: "User 1 Show 1")
user1show1.genre_id = Genre.find_by(name: "Horror").id
user1show1.length_id = Length.find_by(length_description: "1 hr").id
user1show1.user_id = User.find_by(username: "user 1").id
user1show1.save

user1show2 = Show.create(title: "User 1 Show 2")
user1show2.genre_id = Genre.find_by(name: "Comedy").id
user1show2.length_id = Length.find_by(length_description: "30 mins").id
user1show2.user_id = User.find_by(username: "user 1").id
user1show2.save

user1show3 = Show.create(title: "User 1 Show 3")
user1show3.genre_id = Genre.find_by(name: "Drama").id
user1show3.length_id = Length.find_by(length_description: "1 hr").id
user1show3.user_id = User.find_by(username: "user 1").id
user1show3.save

user1show4 = Show.create(title: "User 1 Show 4")
user1show4.genre_id = Genre.find_by(name: "Action").id
user1show4.length_id = Length.find_by(length_description: "20 mins").id
user1show4.user_id = User.find_by(username: "user 1").id
user1show4.save

user2show1 = Show.create(title: "User 2 Show 1")
user2show1.genre_id = Genre.find_by(name: "Horror").id
user2show1.length_id = Length.find_by(length_description: "1 hr").id
user2show1.user_id = User.find_by(username: "user 2").id
user2show1.save

user2show2 = Show.create(title: "User 2 Show 2")
user2show2.genre_id = Genre.find_by(name: "Comedy").id
user2show2.length_id = Length.find_by(length_description: "30 mins").id
user2show2.user_id = User.find_by(username: "user 2").id
user2show2.save

user2show3 = Show.create(title: "User 2 Show 3")
user2show3.genre_id = Genre.find_by(name: "Drama").id
user2show3.length_id = Length.find_by(length_description: "1 hr").id
user2show3.user_id = User.find_by(username: "user 2").id
user2show3.save

user2show4 = Show.create(title: "User 2 Show 4")
user2show4.genre_id = Genre.find_by(name: "Action").id
user2show4.length_id = Length.find_by(length_description: "20 mins").id
user2show4.user_id = User.find_by(username: "user 2").id
user2show4.save

user3show1 = Show.create(title: "User 3 Show 1")
user3show1.genre_id = Genre.find_by(name: "Horror").id
user3show1.length_id = Length.find_by(length_description: "1 hr").id
user3show1.user_id = User.find_by(username: "user 3").id
user3show1.save

user3show2 = Show.create(title: "User 3 Show 2")
user3show2.genre_id = Genre.find_by(name: "Comedy").id
user3show2.length_id = Length.find_by(length_description: "30 mins").id
user3show2.user_id = User.find_by(username: "user 3").id
user3show2.save

user3show3 = Show.create(title: "User 3 Show 3")
user3show3.genre_id = Genre.find_by(name: "Drama").id
user3show3.length_id = Length.find_by(length_description: "1 hr").id
user3show3.user_id = User.find_by(username: "user 3").id
user3show3.save

user3show4 = Show.create(title: "User 3 Show 4")
user3show4.genre_id = Genre.find_by(name: "Action").id
user3show4.length_id = Length.find_by(length_description: "20 mins").id
user3show4.user_id = User.find_by(username: "user 3").id
user3show4.save

user4show1 = Show.create(title: "User 4 Show 1")
user4show1.genre_id = Genre.find_by(name: "Horror").id
user4show1.length_id = Length.find_by(length_description: "1 hr").id
user4show1.user_id = User.find_by(username: "user 4").id
user4show1.save

user4show2 = Show.create(title: "User 4 Show 2")
user4show2.genre_id = Genre.find_by(name: "Comedy").id
user4show2.length_id = Length.find_by(length_description: "30 mins").id
user4show2.user_id = User.find_by(username: "user 4").id
user4show2.save

user4show3 = Show.create(title: "User 4 Show 3")
user4show3.genre_id = Genre.find_by(name: "Drama").id
user4show3.length_id = Length.find_by(length_description: "1 hr").id
user4show3.user_id = User.find_by(username: "user 4").id
user4show3.save

user4show4 = Show.create(title: "User 4 Show 4")
user4show4.genre_id = Genre.find_by(name: "Action").id
user4show4.length_id = Length.find_by(length_description: "20 mins").id
user4show4.user_id = User.find_by(username: "user 4").id
user4show4.save
