# Definition for a  binary tree node
# class TreeNode
#     attr_accessor :left,:right,:data
#     def initialize(data)
#         @data = data
#         @left = nil
#         @right = nil
#     end
# end

class Solution
    # @param a : root node of tree
    # @return an array of integers
    def preorderTraversal(a)

        #iterative
        if a.nil?
            return []
        end

        queue = []
        preorder = []
        queue.push(a)
        while(queue.length > 0) do
            popped = queue.pop #stores TreeNodes
            preorder.push(popped.data)

            if(!popped.right.nil? && popped.right.data != -1)
                queue.push(popped.right)
            end

            if(!popped.left.nil? && popped.left.data != -1)
                queue.push(popped.left)
            end
        end

        preorder
    end
end

# Definition for a  binary tree node
# class TreeNode
#     attr_accessor :left,:right,:data
#     def initialize(data)
#         @data = data
#         @left = nil
#         @right = nil
#     end
# end
class Solution
    # @param a : root node of tree
    # @return the root node in the tree
    def invertTree(a)
        if(!a.nil?)
            # placeholder = a.left
            # a.left = invertTree(a.right)
            # a.right = invertTree(placeholder)
            a.left, a.right = invertTree(a.right), invertTree(a.left)
        end
        a
    end
end

public class Solution {
	public int sqrt(int a) {
	    if (a == 0 || a == 1) {
	        return a;
	    }
	    long long_a = Long.valueOf(a);
	    long start = 0;
	    long end = long_a/2;
	    long result = 0;
	    while (start <= end) {
	       long mid = (start + end)/2;
	       if (mid * mid == long_a) {
	           return (int)mid;
	       } else if(mid * mid < long_a) {
	           start = mid + 1;
	           result = mid;
	       } else {
	           end = mid - 1;
	       }
	    }
	    return (int)result;

	}
}

public class Solution {
	public int searchInsert(ArrayList<Integer> a, int b) {
	    int low = 0;
	    int high = a.size() - 1;

	    while(low <= high) {
	        int mid = (low + high)/2;
	        if(a.get(mid) == b) {
	            return mid;
	        } else if(a.get(mid) > b) {
	            high = mid - 1;
	        } else {
	            low = mid + 1;
	        }
	    }
	    return low;
	}
}
