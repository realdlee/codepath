def fractionToDecimal(a, b)
    return "" if b == 0
    return (a/b).to_s if a == 0

    mod = a % b
    if mod == 0
        result = (a/b).to_s
    else
        if((mod * 10) % b == 0)
            result = (a/b.to_f).to_s
        else

            if a/b >= 1
                result = (a/b).to_s + "."
            else
                result = "0."
            end

            if((a < 0 && b > 0) || (a > 0 && b < 0))
                result = "-" + result
            end

            hash = {}

            while mod != 0 do

                hash[mod] = result.length

                result += ((mod * 10) / b).to_s
                mod = (mod * 10) % b
                if hash[mod]
                    result = result[0, hash[mod]] + "(" + result[hash[mod].. -1 ] + ")"
                end
            end

        end
    end
    result
end

def lengthOfLongestSubstring(a)
  hash = Hash.new(-1)
  count = 0
  max = 0
  most_recent_collision = 0
  a = a.split("")
  a.length.times do |x|
  	previous_index = hash[a[x]]
  	if previous_index == -1 || (x - count > previous_index)
      count +=1
     else
     	count = x - previous_index
     end
     max = count if count > max
    hash[a[x]] = x
  end
  max
end

def anagrams(a)
  hash = Hash.new
  matches = Hash.new { |h, k| h[k] = [] }
  a.each_with_index do |str, i|
    sorted = str.split("").sort.join
    matches[sorted].push(i+1)
  end

  matches.values
end

    def addTwoNumbers(a, b)
        previous = nil
        head = nil
        carry = 0

        while(!a.nil? || !b.nil?)
            sum = carry + (a.nil? ? 0 : a.data) + (b.nil? ? 0 : b.data)
            carry = sum > 9 ? 1 : 0

            sum = sum % 10

            new_node = ListNode.new(sum)

            if head.nil?
                head = new_node
            else
                previous.next = new_node
            end

            previous = new_node

            if(!a.nil?)
                a = a.next
            end

            if(!b.nil?)
                b = b.next
            end
        end

        if carry > 0
            last_node = ListNode.new(carry)
            previous.next = last_node
        end

        head

    end
