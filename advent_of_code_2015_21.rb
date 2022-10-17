
# --- Day 11: Corporate Policy ---
# Santa's previous password expired, and he needs help choosing a new one.

# To help him remember his new password after the old one expires, Santa has devised a method of coming up with a password based on the previous one. Corporate policy dictates that passwords must be exactly eight lowercase letters (for security reasons), so he finds his new password by incrementing his old password string repeatedly until it is valid.

# Incrementing is just like counting with numbers: xx, xy, xz, ya, yb, and so on. Increase the rightmost letter one step; if it was z, it wraps around to a, and repeat with the next letter to the left until one doesn't wrap around.

# Unfortunately for Santa, a new Security-Elf recently started, and he has imposed some additional password requirements:

# Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
# Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
# Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
# For example:

# hijklmmn meets the first requirement (because it contains the straight hij) but fails the second requirement requirement (because it contains i and l).
# abbceffg meets the third requirement (because it repeats bb and ff) but fails the first requirement.
# abbcegjk fails the third requirement, because it only has one double letter (bb).
# The next password after abcdefgh is abcdffaa.
# The next password after ghijklmn is ghjaabcc, because you eventually skip all the passwords that start with ghi..., since i is not allowed.
# Given Santa's current password (your puzzle input), what should his next password be?

# Your puzzle input is hxbxwxba

# Valid psw must have:
# * exactly 8 lowercase letters
# * increasing straight of at least 3 letters (e.g. abc, pqr, xyz)
# * no i, o, l
# * at least 2 non-overlapping pairs of letters (e.g. aa, bb, zz)

psw = "hxbxwxba"

def get_new_working_password_from(psw)
  loop do
    psw = generate_next_pasword_if_not_valid(psw)
    break if is_a_valid?(psw)
  end
  psw
end

def generate_next_pasword_if_not_valid(psw)
  return psw if is_a_valid?(psw)
  psw = psw.next
end

def is_a_valid?(psw)
  return false if not_right_sized?(psw)
  return false if banned_chars_in?(psw)
  return false if no_straight_in?(psw)
  return false if less_than_two_non_overlapping_pairs_in?(psw)
  true
end

def not_right_sized?(psw)
  psw.length != 8
end

def banned_chars_in?(psw)
  psw.match?(/[iol]/)
end

def no_straight_in?(psw)
  psw_char_triplets = psw.split("").each_cons(3).to_a
  no_straights_found = true

  psw_char_triplets.each do |triplet|
    next if triplet.uniq.length < 3

    if triplet[0].next == triplet[1] && triplet[1].next == triplet[2]
      no_straights_found = false
      break
    end
  end
  no_straights_found
end

def less_than_two_non_overlapping_pairs_in?(psw)
  psw_char_pairs = psw.split("").each_cons(2).to_a

  found = 0

  psw_char_pairs.each_with_index do |pair, idx|
    if pair.uniq.length == 1 && (pair != psw_char_pairs[idx + 1])
      found += 1
      break if found == 2
    end
  end
  return true if found < 2
  false
end

p get_new_working_password_from(psw)
