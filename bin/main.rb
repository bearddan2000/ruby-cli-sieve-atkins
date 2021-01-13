#!/usr/bin/env ruby
def SieveOfAtkin(limit)
    o = [];
	# 2 and 3 are known to be prime
	if(limit > 2)
	    o.push(2)
	end

	if(limit > 3)
	    o.push(3)
	end

	# Initialise the sieve array with false values
  sieve = [];
  sieve.fill(false, 0..limit);

	# Mark siev[n] is true if one of the following is true:
	# a) n = (4*x*x)+(y*y) has odd number of
	# solutions, i.e., there exist odd number of distinct pairs (x, y)
	# that satisfy the equation and	n % 12 = 1 or n % 12 = 5.
	# b) n = (3*x*x)+(y*y) has odd number of
	# solutions and n % 12 = 7
	# c) n = (3*x*x)-(y*y) has odd number of
	# solutions, x > y and n % 12 = 11

	for x in 1..limit do
		for y in 1..limit do

			# Main part of Sieve of Atkin
			n = (4 * x * x) + (y * y);
			if(n <= limit && (n % 12 == 1 || n % 12 == 5))
				sieve[n] ^= true;
			end

			n = (3 * x * x) + (y * y);
			if(n <= limit && n % 12 == 7)
			    sieve[n] ^= true;
            end

			n = (3 * x * x) - (y * y);
			if(x > y && n <= limit && n % 12 == 11)
				sieve[n] ^= true;
			end
		end
	end

	# Mark all multiples of squares as non-prime
	for r in 0..limit do
	    if(sieve[r] == true)
		    i = r*r
		    until i >= limit do
				sieve[i] = false;
				i += (r * r)
			end
		end
	end

	# Print primes using sieve[]
	for a in 0..limit do
		if(sieve[a] == true)
			o.push(a);
		end
	end
    puts("[OUTPUT] %s" % o.join(","));
end


# Driver program to test above functions */
def main
  i = 10;
  puts("[INPUT] %d" % i);
  SieveOfAtkin(i);
end
main;
