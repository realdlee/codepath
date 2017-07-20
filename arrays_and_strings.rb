 # https://www.interviewbit.com/problems/implement-strstr/
def strStr(a, b)
	index = -1
	match = ''
	if (a.empty? || b.empty? ) || (!a.empty? && !b.empty? && b.length > a.length)
		index
	else
		a.split("").each_with_index do |x, i|
			if a[i, b.length] == b
				index = i
				break
			end
		end
		index
	end
end

# https://www.interviewbit.com/problems/add-binary-strings/
# @param a : string
# @param b : string
# @return a string
def addBinary(a, b)
	a = a.split("")
	b = b.split("")
	if a.length >= b.length
		iterator = a
	else
		iterator = b
	end
	carry = 0
	total = []

	iterator.length.times do |i|
		x = a.pop.to_s
		y = b.pop.to_s
		if x + y == "00" || x + y == "0"
			if carry == 0
				result = 0
			else
				result = "1"
				carry = 0
			end
		elsif x + y == "10" || x + y == "01" || x + y == "1"
			if carry == 0
				result = "1"
			else
				result = "0"
				carry = 1
			end
		elsif x + y == "11"
			if carry == 0
				result = 0
				carry = 1
			else
				result = 1
				carry = 1
			end
		end
		total.unshift result
	end
	total.unshift carry if carry != 0


	total.join("")

end

# https://www.interviewbit.com/problems/min-steps-in-infinite-grid/

# @param a : array of integers
# @param b : array of integers
# @return an integer
def coverPoints(a, b)
	count = 0
	(a.length - 1).times do |x|
		h = (a[x + 1] - a[x]).abs
		v = (b[x + 1] - b[x]).abs
		count += ( h >= v ? h : v)
	end
	count
end

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
