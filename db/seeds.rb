javad = User.create(name: 'Javad', email: 'javad@javad.com', password: 'javad', password_confirmation: 'javad', has_car?: false)
harry = User.create(name: 'Harry', email: 'harry@harry.com', password: 'harry', password_confirmation: 'harry', has_car?: true)
javad.friends << harry
harry.friends << javad

dbc = Ride.create(name: 'DBC')

harry.provided_rides << dbc
dbc.riders << javad
