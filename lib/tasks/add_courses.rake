namespace :courses do
	desc "Import courses into class directory"
	task :import => :environment do
		require 'CSV'
		data = CSV.read("db/course_info.csv")
		data.shift
		data.each do |row|
			c = Course.new
			c.CallNumber = row[0]
			c.CourseTitle = row[1]
			c.StartTime = row[2]
			c.EndTime = row[3]
			c.MeetsOn = row[4]
			c.Building = row[5]
			c.Room = row[6]
			c.Instructor = row[7]
			c.save
		end
	end
end


