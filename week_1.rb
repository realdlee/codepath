require 'rspec'

#https://www.interviewbit.com/problems/palindrome-string/
def isPalindrome(a)
	copy = a
	copy.downcase!
	copy.gsub!(/[^a-z0-9]/, '')
	copy == copy.reverse ? 1 : 0
end

#https://www.interviewbit.com/problems/length-of-last-word/
def lengthOfLastWord(a)
    array = a.split(" ")
    if array.length == 0
        0
    else
        array[-1].length
    end
end

# https://www.interviewbit.com/problems/max-non-negative-subarray/
def maxset(a)
current_sum = 0
max_sum = 0
current_range = []
max_range = []
starting_index = 0
a.each_with_index do |x, index|
    if x >= 0
        current_sum += x
        current_range << x
        if current_sum >= max_sum
            if current_sum == max_sum
                if current_range.length > max_range.length
                    max_sum = current_sum
                    max_range = current_range
                end
            else
            max_sum = current_sum
            max_range = current_range
        end
        end
    else
        current_sum = 0
        current_range = []
        starting_index = index
    end
end

max_range
end

# https://www.interviewbit.com/problems/find-duplicate-in-array/
def repeatedNumber(a)
	counts = Hash.new 0
	a.each do |x|
		counts[x]+=1
		return x if counts[x] == 2
	end
	return -1

end

# https://www.interviewbit.com/problems/wave-array/
def wave(a)
	wave_array = []
	a.sort!
	while(!a.empty?) do
		wave_array << a.delete_at(1)
		wave_array << a.shift
	end
	wave_array.compact
end
