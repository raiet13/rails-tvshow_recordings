# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roland = User.create(name: 'Roland', username: 'roland', password: 'whale', age: 45, total_recording_hours: 100)
evan = User.create(name: 'Evan', username: 'evan', password: 'evermore', age: 12, total_recording_hours: 5)
bracken = User.create(name: 'Bracken', username: 'bracken', password: 'techie', age: 23, total_recording_hours: 50)
swaine = User.create(name: 'Swaine', username: 'swaine', password: 'thief', age: 34, total_recording_hours: 20)
tani = User.create(name: 'Tani', username: 'tani', password: 'sky', age: 13, total_recording_hours: 15)

OUAT = Show.create(name: 'Once Upon a Time', req_recording_hours: 30, req_age: 18)
Supergirl = Show.create(name: 'Supergirl', req_recording_hours: 15, req_age: 15)
TaJ = Show.create(name: 'Tom and Jerry', req_recording_hours: 5, req_age: 10)

emma = Character.create(name: 'Emma', show: OUAT)
regina = Character.create(name: 'Regina', show: OUAT)
henry = Character.create(name: 'Henry', show: OUAT)
alex = Character.create(name: 'Alex', show: Supergirl)
kara = Character.create(name: 'Kara', show: Supergirl)
lena = Character.create(name: 'Lena', show: Supergirl)
tom = Character.create(name: 'Tom', show: TaJ)
jerry = Character.create(name: 'Jerry', show: TaJ)

recording1 = Recording.create(user: roland, show: OUAT)
recording2 = Recording.create(user: roland, show: Supergirl)
recording3 = Recording.create(user: roland, show: TaJ)
recording4 = Recording.create(user: bracken, show: OUAT)
recording5 = Recording.create(user: bracken, show: Supergirl)
recording6 = Recording.create(user: swaine, show: TaJ)
recording7 = Recording.create(user: tani, show: TaJ)
