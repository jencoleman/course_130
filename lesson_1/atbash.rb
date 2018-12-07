class Atbash
  def self.encode(string)
    chars = string.downcase.gsub(/[^a-z0-9]/, '').split('')
    atbash_words = []
    atbash_chars = convert_chars(chars)

    loop do
      if atbash_chars.size > 5
        atbash_words.push(atbash_chars.slice!(0, 5))
      else
        atbash_words.push(atbash_chars)
        break
      end
    end
    atbash_words.join(' ')
  end

  def self.convert_chars(input)
    alphas = ('a'..'z').to_a
    nums = ('0'..'9').to_a
    input.map { |l| nums.include?(l) ? l : alphas[25 - alphas.index(l)] }.join
  end
end
