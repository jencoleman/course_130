class House
  def self.recite
    lines = 1
    lyrics = pieces.reverse
    result = []
    loop do
      counter = lines

      result.push("This is #{lyrics[counter - 1][0]}" +
      (counter == 1 ? ".\n" : "\n"))

      result.push(the_rest(counter, lyrics))
      result.push("\n") if lines < 12
      break if lines == 12
      lines += 1
    end
    result.join
  end

  class << self
    private

    def the_rest(num, phrase_arr)
      array = []
      count = num

      loop do
        break if count <= 1
        array.push("#{phrase_arr[count - 1][1]} #{phrase_arr[count - 2][0]}" +
        (count == 2 ? ".\n" : "\n"))
        count -= 1
      end
      array.join
    end

    def pieces
      [
        ['the horse and the hound and the horn', 'that belonged to'],
        ['the farmer sowing his corn', 'that kept'],
        ['the rooster that crowed in the morn', 'that woke'],
        ['the priest all shaven and shorn', 'that married'],
        ['the man all tattered and torn', 'that kissed'],
        ['the maiden all forlorn', 'that milked'],
        ['the cow with the crumpled horn', 'that tossed'],
        ['the dog', 'that worried'],
        ['the cat', 'that killed'],
        ['the rat', 'that ate'],
        ['the malt', 'that lay in'],
        ['the house that Jack built']
      ]
    end
  end
end
