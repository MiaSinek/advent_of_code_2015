# --- Part Two ---
# In all the commotion, you realize that you forgot to seat yourself. At this point, you're pretty apathetic toward the whole thing, and your happiness wouldn't really go up or down regardless of who you sit next to. You assume everyone else would be just as ambivalent about sitting next to you, too.

# So, add yourself to the list, and give all happiness relationships that involve you a score of 0.

# What is the total change in happiness for the optimal seating arrangement that actually includes yourself?

guest_list = "Alice would lose 2 happiness units by sitting next to Bob.
Alice would lose 62 happiness units by sitting next to Carol.
Alice would gain 65 happiness units by sitting next to David.
Alice would gain 21 happiness units by sitting next to Eric.
Alice would lose 81 happiness units by sitting next to Frank.
Alice would lose 4 happiness units by sitting next to George.
Alice would lose 80 happiness units by sitting next to Mallory.
Bob would gain 93 happiness units by sitting next to Alice.
Bob would gain 19 happiness units by sitting next to Carol.
Bob would gain 5 happiness units by sitting next to David.
Bob would gain 49 happiness units by sitting next to Eric.
Bob would gain 68 happiness units by sitting next to Frank.
Bob would gain 23 happiness units by sitting next to George.
Bob would gain 29 happiness units by sitting next to Mallory.
Carol would lose 54 happiness units by sitting next to Alice.
Carol would lose 70 happiness units by sitting next to Bob.
Carol would lose 37 happiness units by sitting next to David.
Carol would lose 46 happiness units by sitting next to Eric.
Carol would gain 33 happiness units by sitting next to Frank.
Carol would lose 35 happiness units by sitting next to George.
Carol would gain 10 happiness units by sitting next to Mallory.
David would gain 43 happiness units by sitting next to Alice.
David would lose 96 happiness units by sitting next to Bob.
David would lose 53 happiness units by sitting next to Carol.
David would lose 30 happiness units by sitting next to Eric.
David would lose 12 happiness units by sitting next to Frank.
David would gain 75 happiness units by sitting next to George.
David would lose 20 happiness units by sitting next to Mallory.
Eric would gain 8 happiness units by sitting next to Alice.
Eric would lose 89 happiness units by sitting next to Bob.
Eric would lose 69 happiness units by sitting next to Carol.
Eric would lose 34 happiness units by sitting next to David.
Eric would gain 95 happiness units by sitting next to Frank.
Eric would gain 34 happiness units by sitting next to George.
Eric would lose 99 happiness units by sitting next to Mallory.
Frank would lose 97 happiness units by sitting next to Alice.
Frank would gain 6 happiness units by sitting next to Bob.
Frank would lose 9 happiness units by sitting next to Carol.
Frank would gain 56 happiness units by sitting next to David.
Frank would lose 17 happiness units by sitting next to Eric.
Frank would gain 18 happiness units by sitting next to George.
Frank would lose 56 happiness units by sitting next to Mallory.
George would gain 45 happiness units by sitting next to Alice.
George would gain 76 happiness units by sitting next to Bob.
George would gain 63 happiness units by sitting next to Carol.
George would gain 54 happiness units by sitting next to David.
George would gain 54 happiness units by sitting next to Eric.
George would gain 30 happiness units by sitting next to Frank.
George would gain 7 happiness units by sitting next to Mallory.
Mallory would gain 31 happiness units by sitting next to Alice.
Mallory would lose 32 happiness units by sitting next to Bob.
Mallory would gain 95 happiness units by sitting next to Carol.
Mallory would gain 91 happiness units by sitting next to David.
Mallory would lose 66 happiness units by sitting next to Eric.
Mallory would lose 75 happiness units by sitting next to Frank.
Mallory would lose 99 happiness units by sitting next to George."

# STEPS:
# 1. get the guests from the guest list
# 2. add yourself to the list as an ambivalent guest
# 3. get the guest to guest happyness from the guest list
# 4. get all possible seating orders
# 5. get the max seating happyness

def get_guests_from(guest_list)
  guest_list.split("\n").map { |line| line.split(" ").first }.uniq
end

@guests = get_guests_from(guest_list)

def add_myslef_to_the(guest_list)
  @guests.each do |guest|
    guest_list += "\nMia would gain 0 happiness units by sitting next to #{guest}."
    guest_list += "\n#{guest} would gain 0 happiness units by sitting next to Mia."
  end
  guest_list
end

def get_guest_to_guest_happyness_from(guest_list)
  updated_guest_list = add_myslef_to_the(guest_list)

  updated_guest_list.split("\n").each_with_object([]) do |line, happyness_ary|
    guest1, gain_or_loose, happyness_from, guest2 = line.scan(/(\w+) would (gain|lose) (\d+) happiness units by sitting next to (\w+)/).flatten
    happyness_ary << [guest1, guest2, happyness_factor(gain_or_loose, happyness_from)]
  end
end

def happyness_factor(gain_or_loose, happyness_from)
  happyness = gain_or_loose.match(/gain/) ? happyness_from.to_i : -happyness_from.to_i
end

@happyness_ary = get_guest_to_guest_happyness_from(guest_list)

def all_possible_seating_orders
  (@guests << "Mia").permutation.to_a
end

def max_seating_happyness
  max_seating_happyness = 0

  # all_possible_seating_orders is an array of arrays -> sub arrays are the possible seating orders e.g. ["Alice", "Bob", "Carol", "David"]
  all_possible_seating_orders.each do |seating_order|
    happyness_score = 0
    seating_order.each_with_index do |guest, index|
      # get the happyness of the guest towards the next guest and vice versa -> once you reach the last person in the seating order, hook them up with the first person in the seating order to close the seating loop

      happyness_score += @happyness_ary.select { |guest1, guest2, happyness| guest1 == guest && guest2 == (seating_order[index + 1] || seating_order[0]) }.first[2]
      happyness_score += @happyness_ary.select { |guest1, guest2, happyness| guest1 == (seating_order[index + 1] || seating_order[0]) && guest2 == guest }.first[2]

    end
    max_seating_happyness = happyness_score if happyness_score > max_seating_happyness
  end
  max_seating_happyness
end

p max_seating_happyness

