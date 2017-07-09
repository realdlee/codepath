#1
O(n)

#2
class Solution
    # param a : integer
    # return a array of array of integers
    def prettyPrint(a)
	    m = [[1]]
	    return m if a == 1
	    2.upto(a) do |x|
		    m = matrix(m)
	    end
			m
    end

    def matrix(m)
	    m.each do |y|
		    y.push(y[0] + 1)
		    y.unshift(y[0] + 1)
	    end
	    m.push(Array.new(m[0].size, m[0][0]))
	    m.unshift(Array.new(m[0].size, m[0][0]))
    end
end

#3.1
class Solution
    # param a : array of integers
    # param b : integer
    #return an integer
    def kthsmallest(a, b)
        k = 0
        num = nil
        a.sort.each do |x|
            k+=1
            num = x if k == b
        end
        num
    end
end

#3.2
class Solution
    # @param a : array of integers
    # @param b : integer
    # @param c : integer
    # @return an integer
    def numRange(a, b, c)
	count = 0
	matches = []
	a.length.times do |x|
		a.length.times do |y|
			y+=1
			s = a[x,y].inject(:+)
			if x + y > a.length || s > c
			    break
			end
			if s >= b && s <= c
				count +=1
				matches.concat a[x,y]
			end
		end
	end
	count
    end
end

#4.1
class Solution
    # @param a : head node of linked list
    # @return the head node in the linked list
    def subtract(a)
        return a if a.next.nil?

        mid = a
        count = 0
        fast = a
         while !fast.next.nil? && !fast.next.next.nil?
            mid = mid.next
            fast = fast.next.next
            count+=1
        end

        e = reverse(mid)
        sub(a, e, count)
        reverse e
        a
    end

    def reverse(start)
        current = start
        previous = nil
        next_node = nil

        while(!current.nil?)
            next_node = current.next
            current.next = previous
            previous = current
            current = next_node
        end

        previous
    end

    def sub(head, e, count)
        while count >= 0
            head.data = e.data - head.data if e != head
            head = head.next
            e = e.next
            count-=1
        end
    end
end

#4.2
class Solution
    # @param a : array of integers
    # @return an array of integers
    def nextGreater(a)
        result = a.map.each_with_index do |x, index|
						high = -1
            t = a[(index + 1).. -1].map do |y|
              if y > x
                  high = y
                  break
              end
            end
            high
        end

    end
end

#5.1
class Solution
    # @param a : array of integers
    # @return an array of array of integers
    def permute(a)
        pm = []
	    recurse(a, 0, pm)
	    pm.uniq
    end

    def recurse(a, index, p)
	    if index == a.length - 1
		    return p << a
	    end
	    index.upto(a.length - 1) do |x|
		    copy = a.dup
		    copy[index], copy[x] = copy[x], copy[index]
		    recurse(copy, index + 1, p)
	    end
    end
end

#5.2
class Solution
    # @param a : constant array of integers
    # @return an integer
    def longestConsecutive(a)
	count = []
	longest = 1
	org = a.dup.sort
	org.each_with_index do |x, index|
		count << x if x != org[index + 1] || x + 1 == org[index + 1]
		if x + 1 != org[index + 1] && x != org[index + 1]
			if longest < count.length
				longest = count.length
			end
			count = []
		end
	end
	longest
    end
end

