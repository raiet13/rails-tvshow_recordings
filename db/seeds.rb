# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Roland', password: 'whale', age: 45, recording_hours: 10)
user2 = User.create(name: 'Evan', password: 'evermore', age: 12, recording_hours: 5)
user3 = User.create(name: 'Bracken', password: 'techie', age: 23, recording_hours: 50)
user4 = User.create(name: 'Swaine', password: 'thief', age: 34, recording_hours: 20)
user5 = User.create(name: 'Tani', password: 'sky', age: 13, recording_hours: 15)

OUAT = Show.create(name: 'Once Upon a Time', req_recording_hours: 30, req_age: 18)
Supergirl = Show.create(name: 'Supergirl', req_recording_hours: 15, req_age: 15)
TaJ = Show.create(name: 'Tom and Jerry', req_recording_hours: 5, req_age: 10)

emma = Character.create(name: 'Emma', OUAT)
regina = Character.create(name: 'Regina', OUAT)
henry = Character.create(name: 'Henry', OUAT)
alex = Character.create(name: 'Alex', Supergirl)
kara = Character.create(name: 'Kara', Supergirl)
lena = Character.create(name: 'Lena', Supergirl)
tom = Character.create(name: 'Tom', TaJ)
jerry = Character.create(name: 'Jerry', TaJ)

recording1 = Recording.create(user1, OUAT)
recording2 = Recording.create(user1, Supergirl)
recording3 = Recording.create(user1, TaJ)
recording4 = Recording.create(user3, OUAT)
recording5 = Recording.create(user3, Supergirl)
recording6 = Recording.create(user4, TaJ)
recording7 = Recording.create(user5, TaJ)
