class Prime
  def self.nth(num)
    selection = num.to_i
    number = 2
    primes = []

    loop do
      primes.push(number) if prime(number)
      if selection == 0
        raise ArgumentError, 'Argument must be larger than zero'
      elsif primes.size == selection
        return primes.last
      end
      number += 1
    end
  end

  def self.prime(input)
    divisors = (1..(Math.sqrt(input).floor)).to_a.select { |n| input % n == 0 }
    true if divisors == [1]
  end
end
