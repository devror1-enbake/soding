require 'prime'

def consecutive_primes
  #Limit in which sum of primes should lie 
  limit = 1000000

  #array of all prime numbers upto given limit
  p_array = Prime.each(limit).map{|a| a}

  #last index for prime numbers array
  last_index = p_array.length - 1

  #number of consecutive primes
  cons_count = 0

  #Initialize sum, counter and answer
  sum = 0
  count = 0
  ans = 0
   
  (0..last_index).each do |i| #loop from first to last index of prime array
    sum = p_array[i] #always take first element as sum
    count = 1 #initialize count to 1
   
    (i+1).upto(last_index) do |e|
      sum += p_array[e] #add next prime to sum
      break if sum > limit #if sum exceeds the limit, break
   
      count += 1 #else increase counter
   
      #if count exceeds consecutives count found earlier also the sum is a prime, then update
      if count > cons_count && sum.prime?
        cons_count = count
        ans = sum
      end
    end
  end
   
  puts "The longest sum of consecutive primes below #{limit} that adds to a prime, contains #{cons_count} terms, and is equal to #{ans}"
end

consecutive_primes