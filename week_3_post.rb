#power function
#int overflow

#not work for large int
public class Solution {
	public int pow(int x, int n, int d) {
	    return mod(power(x,n), d);
	}

public int mod(int x, int y) {
    if(y == 1) {
        return 0;
    }
    if(x==1) {
        return 1;
    }
    if(x > 0 && x - y < 0) {
        return y;
    } else if(x < 0) {
        if(x - y < 0) {
            return x + y;
        } else {
            return mod(x+y, y);
        }
    } else {
        return mod(x-y, y);
    }
}

public int power(int x, int y) {
    long lx = Long.valueOf(x);
    long ly = Long.valueOf(y);
    if(ly == 0) {
        return 1;
    }
    long temp = Long.valueOf(power(x,y/2));
    if (ly%2 == 0)
        return (int)(temp*temp);
    else
        return (int)(lx*temp*temp);
    }
}

public class Solution {
	// DO NOT MODIFY THE LIST
	public int search(final List<Integer> a, int b) {
	    int pivot = find_pivot(a, 0, a.size() - 1);

	    if(a.get(pivot) == b) {
	        return pivot;
	    }
	    if(a.get(0) <= b) {
	        return binary(a, 0, pivot - 1, b);
	    } else {
	        return binary(a, pivot + 1, a.size() - 1, b);
	    }
	}

	public int binary(final List<Integer> a, int low, int high, int key) {
	    if(high < low ) {
	        return -1;
	    }
	    int mid = (low + high)/2;
	    if(a.get(mid) == key ) {
	        return mid;
	    } else if(a.get(mid) < key) {
	        return binary(a, mid + 1, high, key);
	    }else {
	        return binary(a, low, mid - 1, key);
	    }
	}

	public int find_pivot(final List<Integer> a, int low, int high) {
	    if(low == high) {
	        return low;
	    }
	    if(high < low) {
	        return -1;
	    }

	    int mid = (low + high)/2;
	    if(mid < high && a.get(mid) > a.get(mid + 1)) {
	        return mid;
	    }
	    if(a.get(mid) < a.get(low)) {
	        return find_pivot(a, low, mid -1);
	    } else {
	        return find_pivot(a, mid + 1, high);
	    }
	}
}




class Solution
    # @param a : root node of tree
    # @return an integer
    def maxDepth(a)
        return 0 if a.nil?
        1 + [maxDepth(a.left), maxDepth(a.right)].max
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
  # @param b : root node of tree
  # @return an integer
  def isSameTree(a, b)
    if (a.nil? && b.nil?)
      1
    elsif !a.nil? && !b.nil?
      return a.data == b.data &&
      isSameTree(a.left, b.left) &&
      isSameTree(a.right, b.right)
    else
      0
    end
  end
end

public class Solution {
  public int isSameTree(TreeNode A, TreeNode B) {
    if (A == null && B == null){
        return 1;
    }
    if (A != null && B != null) {
        return ((A.val == B.val ? 1 : 0) & isSameTree(A.left, B.left) & isSameTree(A.right, B.right));
    }
    return 0;

  }
}
