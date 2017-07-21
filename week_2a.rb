def diffPossible(a,b)
	hash = Hash.new
	a.each_with_index do |x, index|
		if hash[x]
			return 1
		else
			hash[(b+x)] = index
			hash[(x-b)] = index
		end
	end
	return 0
end

def twoSum(a, b)
	return [] if a.length < 2
	hash = {}
	matches = []
	a.each_with_index do |x, index|
		if hash[x]
			# matches << [hash[x] + 1, index + 1]
			return [hash[x] + 1, index + 1]
		elsif hash[b-x].nil? #tricky, don't overwrite
			hash[b-x] = index
		end
	end
	return []
end

def mergeTwoLists(a, b)
    head = ListNode.new(nil)
    current = head

    while(!a.nil? || !b.nil?)
        if(!a.nil? && !b.nil?)
            if(a.data < b.data)
                current.next = a
                a = a.next
            else
                current.next = b
                b = b.next
            end
            current = current.next
        elsif a.nil?
            current.next = b
            break
        elsif b.nil?
            current.next = a
            break
        end
    end

    head = head.next
end

class Solution
    # @param a : head node of linked list
    # @return the head node in the linked list
    def swapPairs(a)
        current = a
        while !current.next.nil? do
        temp = current.data
        current.data = current.next.data
        current.next.data = temp
        # if !current.next.nil?
            current = current.next
        if !current.next.nil?
            current = current.next
        end
    # end
    end
        a
    end
end
