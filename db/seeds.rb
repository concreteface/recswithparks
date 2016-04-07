# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

FactoryGirl.create(:user)
FactoryGirl.create(:user)
Park.create([{ name: 'Boston Public Garden #1', street: 'Beacon', description: 'Super cool garden' }, {name: 'Boston Public Garden #2', street: 'Beacon', description: 'Super cool garden'}])
Review.create([{ rating: 4, body: 'This park is really cool 1', user_id: 1, park_id: 1}])
Review.create([{ rating: 3, body: 'This park is really cool 2', user_id: 1, park_id: 2}])
Review.create([{ rating: 2, body: 'This park is really cool 3', user_id: 2, park_id: 1}])
Review.create([{ rating: 1, body: 'This park is really cool 4', user_id: 2, park_id: 2}])
