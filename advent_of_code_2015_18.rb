# --- Day 9: All in a Single Night ----
#
# -------------- Part Two -------------
# The next year, just to show off, Santa decides to take the route with the longest distance instead.

# He can still start and end at any two (different) locations he wants, and he still must visit each location exactly once.

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

# there is space for loads of improvement, but it works ;)

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

# get the farhtest city from the starting city and the distance between the two
def farthest_city_and_distance_from(start_city, visited_cities)
  @cities_distances_combos.select { |city_distance| city_distance[0].include?(start_city) && (city_distance[0] & visited_cities).empty?}.max_by { |city_distance| city_distance[1] }
end

# calculate the longest route from all the possile starting cities
def longest_routes_from_all_cities(distances)
  @cities_distances_combos = combos_for_cities(distances)
  @cities = cities_to_visit_from(distances)
  @longest_routes = []

  @cities.each do |city|
    start_city = city
    visited_cities = []
    longest_route_from_start_city = []

    while visited_cities.length < @cities.length
      farthest_city_and_distance = farthest_city_and_distance_from(start_city, visited_cities)
      visited_cities << start_city
      if farthest_city_and_distance
        longest_route_from_start_city << farthest_city_and_distance
        start_city = longest_route_from_start_city.last[0].reject { |c| c == start_city }.first
      else
        @longest_routes << longest_route_from_start_city
      end
    end
  end
  @longest_routes
end

# get the longest distance from all the longest routes
def longest_distance_to_travel(distances)
  longest_route = 0

  longest_routes_from_all_cities(distances).map do |longest_route_from_start_city|
    route_length = longest_route_from_start_city.map { |route| route[1] }.reduce(:+)
    longest_route = [route_length, longest_route].max
  end

  longest_route
end

p longest_distance_to_travel(distances)
