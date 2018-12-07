class Primes
  def self.nth_prime(nth)
    selection = nth.to_i
    number = 2
    primes = []
    
    loop do
      primes.push(number) if prime(number)
      if primes.size == selection
        return primes.last
        break
      end
      number += 1
    end
  end
  
  def self.prime(input)
    divisors = (1..(Math.sqrt(input).floor)).to_a.select { |n| input%n == 0 }
    true if (divisors == [1])
  end
end
