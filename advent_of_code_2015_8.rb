require 'digest'

def lowest_number_for(string)
  (1..Float::INFINITY).lazy.each do |num|
    secret_key = Digest::MD5.hexdigest (string + num.to_s)
    return num if secret_key.slice(0, 6) == "000000"
  end
end
