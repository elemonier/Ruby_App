#purge db
Mongoid.purge!

#import classes from rake task
Rake::Task['courses:import'].invoke

#create new user
usr = User.new
usr.first_name = "Emily"
usr.last_name = "Lemonier"
usr.email = "emily.lemonier@gmail.com"
usr.save

#associate courses with users
20.times do
	c = Course.all.sample
	u = User.all.sample
	c.users << u unless c.users.include?(u)	#prevents duplicates
	u.courses << c unless u.courses.include?(c)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
