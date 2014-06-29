javad = User.create(name: 'javad'.capitalize, email: 'javad@javad.com', password: 'javad', password_confirmation: 'javad', has_car?: false)
harry = User.create(name: 'harry'.capitalize, email: 'harry@harry.com', password: 'harry', password_confirmation: 'harry', has_car?: true)
michael = User.create(name: 'michael'.capitalize, email: 'michael@michael.com', password: 'michael', password_confirmation: 'michael', has_car?: false)
greg = User.create(name: 'greg'.capitalize, email: 'greg@greg.com', password: 'greg', password_confirmation: 'greg', has_car?: true)
jake = User.create(name: 'jake'.capitalize, email: 'jake@jake.com', password: 'jake', password_confirmation: 'jake', has_car?: false)
jaime = User.create(name: 'jaime'.capitalize, email: 'jaime@jaime.com', password: 'jaime', password_confirmation: 'jaime', has_car?: true)
amelia = User.create(name: 'amelia'.capitalize, email: 'amelia@amelia.com', password: 'amelia', password_confirmation: 'amelia', has_car?: false)
ryan = User.create(name: 'ryan'.capitalize, email: 'ryan@ryan.com', password: 'ryan', password_confirmation: 'ryan', has_car?: true)
jay = User.create(name: 'jay'.capitalize, email: 'jay@jay.com', password: 'jay', password_confirmation: 'jay', has_car?: false)
johnathan = User.create(name: 'johnathan'.capitalize, email: 'johnathan@johnathan.com', password: 'johnathan', password_confirmation: 'johnathan', has_car?: true)
osagie = User.create(name: 'osagie'.capitalize, email: 'osagie@osagie.com', password: 'osagie', password_confirmation: 'osagie', has_car?: false)
jarrod = User.create(name: 'jarrod'.capitalize, email: 'jarrod@jarrod.com', password: 'jarrod', password_confirmation: 'jarrod', has_car?: true)
rohan = User.create(name: 'rohan'.capitalize, email: 'rohan@rohan.com', password: 'rohan', password_confirmation: 'rohan', has_car?: false)

ghopps = [javad, harry, michael, greg, jake, jaime, amelia, ryan, jay, johnathan, osagie, jarrod, rohan]
destinations = ['MSU', 'CSUCI', 'SXSW', 'Wisconsin Dells', 'NYC', 'U of I', 'IU', 'Las Vegas', 'SF']

ghopps.each do |hopper|
  rand(10).times do |t|
    friend = ghopps.sample
    friendship = Friendship.new(user_id: hopper.id, friend_id: friend.id)
    if friendship.save
    else
    end
  end
end

ghopps.each do |hopper|
  if hopper.has_car? == true
    start_date = rand(1.years).from_now
    end_date = start_date + rand(8).days
    ride = Ride.create(name: destinations.pop, start_time: start_date, end_time: end_date, total_cost: rand(5.0..50.0).round(2))
    hopper.provided_rides << ride
  end
end

rides = Ride.all

rides.each do |ride|
  hoppers = ghopps.dup
  rand(10).times do |t|
    hopper = hoppers.sample
    ride.riders << hopper
    hoppers.delete(hopper)
  end
end
