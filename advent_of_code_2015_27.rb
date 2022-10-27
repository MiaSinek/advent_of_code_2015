# --- Day 14: Reindeer Olympics ---
# This year is the Reindeer Olympics! Reindeer can fly at high speeds, but must rest occasionally to recover their energy. Santa would like to know which of his reindeer is fastest, and so he has them race.

# Reindeer can only either be flying (always at their top speed) or resting (not moving at all), and always spend whole seconds in either state.

# For example, suppose you have the following Reindeer:

# Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
# Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
# After one second, Comet has gone 14 km, while Dancer has gone 16 km. After ten seconds, Comet has gone 140 km, while Dancer has gone 160 km. On the eleventh second, Comet begins resting (staying at 140 km), and Dancer continues on for a total distance of 176 km. On the 12th second, both reindeer are resting. They continue to rest until the 138th second, when Comet flies for another ten seconds. On the 174th second, Dancer flies for another 11 seconds.

# In this example, after the 1000th second, both reindeer are resting, and Comet is in the lead at 1120 km (poor Dancer has only gotten 1056 km by that point). So, in this situation, Comet would win (if the race ended at 1000 seconds).

# Given the descriptions of each reindeer (in your puzzle input), after exactly 2503 seconds, what distance has the winning reindeer traveled?

# STEPS:
# 1. Create a hash of reindeer names and their stats
# 2. Calculate the distance each reindeer has traveled after 2503 seconds
# 3. Return the max distance

input = "Vixen can fly 8 km/s for 8 seconds, but then must rest for 53 seconds.
Blitzen can fly 13 km/s for 4 seconds, but then must rest for 49 seconds.
Rudolph can fly 20 km/s for 7 seconds, but then must rest for 132 seconds.
Cupid can fly 12 km/s for 4 seconds, but then must rest for 43 seconds.
Donner can fly 9 km/s for 5 seconds, but then must rest for 38 seconds.
Dasher can fly 10 km/s for 4 seconds, but then must rest for 37 seconds.
Comet can fly 3 km/s for 37 seconds, but then must rest for 76 seconds.
Prancer can fly 9 km/s for 12 seconds, but then must rest for 97 seconds.
Dancer can fly 37 km/s for 1 seconds, but then must rest for 36 seconds."


def get_reindeer_stats_from(input)
  input.split("\n").each_with_object([]) do |line, reindeer_stats|
    name, speed, fly_time, rest_time = line.match(/(\w+) can fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./).captures
    stats = { name: name, speed: speed.to_i, fly_time: fly_time.to_i, rest_time: rest_time.to_i }
    reindeer_stats << stats
  end
end

def rest_fly_cycle_time_for(reindeer_stat)
  # reindeer_stat = @reindeer_stats.find { |reindeer_stat| break reindeer_stat if reindeer_stat[:name] == reindeer }
  # p reindeer_stat
  reindeer_stat[:fly_time] + reindeer_stat[:rest_time]
end

def number_of_full_cycles_in(time, reindeer_stat)
  time / rest_fly_cycle_time_for(reindeer_stat)
end

def partial_cycle_length_in(time, reindeer_stat)
  time % rest_fly_cycle_time_for(reindeer_stat)
end

def distance_traveled_in_partial_cycle_of(time, reindeer_stat)
   #calculate the distance traveled in the last (partial) cycle: the fly time is the minimum of the fly time and the partial cycle time (reindeers can't overstep their fly time even in partial cycles)
  [partial_cycle_length_in(time, reindeer_stat), reindeer_stat[:fly_time]].min * reindeer_stat[:speed]
end

def distance_traveled_in_full_cycle_of(time, reindeer_stat)
  number_of_full_cycles_in(time, reindeer_stat) * reindeer_stat[:speed] * reindeer_stat[:fly_time]
end

def distance_traveled_in(time, reindeer_stat)
  distance_traveled_in_full_cycle_of(time, reindeer_stat) + distance_traveled_in_partial_cycle_of(time, reindeer_stat)
end

def reindeer_olympics_winner_distance_after(time, input)
  reindeer_stats = get_reindeer_stats_from(input)
  reindeer_stats.map { |reindeer_stat| distance_traveled_in(time, reindeer_stat) }.max
end

p reindeer_olympics_winner_distance_after(2503, input)
