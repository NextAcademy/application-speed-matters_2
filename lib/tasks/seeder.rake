namespace :seeder do
  desc "pre-calculate total points for users"
  task seed_total_points: :environment do
  	User.all.each do |x|
  		x.total_points = x.points.sum(:value)
  		x.save
  		puts "#{x.username}'s total points is #{x.total_points}."
  	end
  end
end
