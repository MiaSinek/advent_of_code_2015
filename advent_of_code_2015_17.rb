# --- Day 9: All in a Single Night ---
# Every year, Santa manages to deliver all of his presents in a single night.

# This year, however, he has some new locations to visit; his elves have provided him the distances between every pair of locations. He can start and end at any two (different) locations he wants, but he must visit each location exactly once. What is the shortest distance he can travel to achieve this?

# For example, given the following distances:

# London to Dublin = 464
# London to Belfast = 518
# Dublin to Belfast = 141
# The possible routes are therefore:

# Dublin -> London -> Belfast = 982
# London -> Dublin -> Belfast = 605
# London -> Belfast -> Dublin = 659
# Dublin -> Belfast -> London = 659
# Belfast -> Dublin -> London = 605
# Belfast -> London -> Dublin = 982
# The shortest of these is London -> Dublin -> Belfast = 605, and so the answer is 605 in this example.

# What is the distance of the shortest route?

#first nasty stab at the problem - not nice or ideal, but it works ;)

# Steps taken:
# 1) get a list of all cities to be visited
# 2) choose a starting city (took the first on the list)
# 3) generate the cities_distance combos from the distances input: [[city1, city2], distance]
# 4) calculate the closest city to the starting city and add its cities_distance combo the the shortest route array (the combo contains the starting city, target city and the distance between the two cities). After each calculation delete ALL cities-distance combos from the cities_distances array that contain the starting city to make sure we are not taking the same city into consideration twice (we want to visit each city only one time).
# 5) before the calculation remove the starting city from the cities to be visited array
# 6) set the new starting city to be the target city of the last trip
# 7) keep looping on the cities to be visited array and calculate the distance to the closest city until we have visited all the cities
# 8) from the shortest route array that contains the [[city1,city2], distance] combos of the shortest trip calculate the total distance to be traveled

distances = "Faerun to Tristram = 65
Faerun to Tambi = 129
Faerun to Norrath = 144
Faerun to Snowdin = 71
Faerun to Straylight = 137
Faerun to AlphaCentauri = 3
Faerun to Arbre = 149
Tristram to Tambi = 63
Tristram to Norrath = 4
Tristram to Snowdin = 105
Tristram to Straylight = 125
Tristram to AlphaCentauri = 55
Tristram to Arbre = 14
Tambi to Norrath = 68
Tambi to Snowdin = 52
Tambi to Straylight = 65
Tambi to AlphaCentauri = 22
Tambi to Arbre = 143
Norrath to Snowdin = 8
Norrath to Straylight = 23
Norrath to AlphaCentauri = 136
Norrath to Arbre = 115
Snowdin to Straylight = 101
Snowdin to AlphaCentauri = 84
Snowdin to Arbre = 96
Straylight to AlphaCentauri = 107
Straylight to Arbre = 14
AlphaCentauri to Arbre = 46"

# generate a list of all the cities Santa has to visit
def cities_to_visit_from(distances)
  cities = []
  distances.split("\n").each do |distance|
    cities << distance.scan(/([A-Z][a-z]+?)\s/)
  end
  cities.flatten.uniq
end

# generate [[city1, city2], distance] combos from the distances input
def combos_for_cities(distances)
  cities_distances_combos = []
  distances.split("\n").map do |distance|
    cities = distance.scan(/([A-Z][a-z]+?)\s/).flatten
    distance = distance.scan(/(\d+)/).flatten.first.to_i
    cities_distances_combos << [cities, distance]
  end
  cities_distances_combos
end

@cities_distances_combos = combos_for_cities(distances)


# calculate the closest city to the start city and return it in a form: [[city1, city2], distance]
def closest_city_and_distance_to(start_city)
  closest_city_and_distance = @cities_distances_combos.select { |city_distance| city_distance[0].include? start_city }.min_by { |city_distance| city_distance[1] }

  @cities_distances_combos.delete_if {|cd_combo| cd_combo[0].include? start_city }

  closest_city_and_distance
end

# generate an array that contains all the cities-distance combos ([[city1, city2], distance]) for the shortest route
def shortest_route(distances)
  cities = cities_to_visit_from(distances)
  start_city = cities.first

  shortest_route = []

  until cities.empty? do
    cities.delete(start_city)
    closest_city_and_distance = closest_city_and_distance_to(start_city)

    return shortest_route if closest_city_and_distance.nil?

    shortest_route << closest_city_and_distance

    start_city = shortest_route.last[0].reject { |c| c == start_city }.first
  end
end

# calculate the total distance to be traveled if taking the shortest route
def shortest_distance_to_travel(distances)
  min_dist = shortest_route(distances).map { |route| route[1] }.reduce(:+)

  "Santa has to travel at least #{min_dist}! Let's gooooooo!"
end

p shortest_distance_to_travel(distances)
