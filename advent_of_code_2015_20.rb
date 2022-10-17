# --- Part Two ---
# Neat, right? You might also enjoy hearing John Conway talking about this sequence (that's Conway of Conway's Game of Life fame).

# Now, starting again with the digits in your puzzle input, apply this process 50 times. What is the length of the new result?

input = "1113122113"

def look_and_say(input)
  50.times do
    input = input.gsub(/(.)\1*/) { |match| match.length.to_s + match[0] }
  end
  input.length
end

p look_and_say(input)
