100.times do
  make = Faker::Vehicle.make
  @car = Car.new(
    name: Faker::Vehicle.model(make_of_model: make),
    brand: make,
    transmission: Faker::Vehicle.transmission,
    price: Faker::Vehicle.mileage(min: 100, max: 1000),
    seats: Faker::Vehicle.door_count,
    trunk: Faker::Vehicle.mileage(min: 100, max: 1000),
    )
  @car.save
end
