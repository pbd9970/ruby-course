
class CarStats
  def self.calc_top_color(cars)
    cars = cars.map { |car| car.color }
    histogram = cars.inject(Hash.new(0)) do |r, e|
      r[e] += 1
      r
    end

    histogram.max_by { |cars,count| count }.first
  end

  def self.calc_bottom_color(cars)
    cars = cars.map { |car| car.color }
    histogram = cars.inject(Hash.new(0)) do |r, e|
      r[e] += 1
      r
    end

    histogram.min_by { |cars,count| count }.first
  end
end
