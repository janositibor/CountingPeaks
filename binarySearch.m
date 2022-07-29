function [index] = binarySearch(A, n, num)
%--------------------------------------------------------------------------
% Syntax:       [index] = binarySearch(A, n, num);
%               
% Inputs:       A: Array (sorted) that you want to search
%               n: Length of array A
%               num: Number you want to search in array A
%               
% Outputs:      index: Return position in A that A(index) == num
%                      or -1 if num does not exist in A
%               
% Description:  This function find number in array (sorted) using binary
%               search
%               
% Complexity:   O(1)    best-case performance
%               O(log_2 (n))    worst-case performance
%               O(1)      auxiliary space
%               
% Author:       Trong Hoang Vo
%               hoangtrong2305@gmail.com
%               
% Date:         March 31, 2016
%--------------------------------------------------------------------------
left = 1;
right = n;
flag = 0;
while left <= right
    mid = ceil((left + right) / 2);
    
    if A(mid) == num
        index = mid;
        flag = 1;
        break;
    else if A(mid) > num
        right = mid - 1;
        else
            left = mid + 1;
        end
    end
end
if flag == 0;
	%temp_left=[left,A(left)]
	%temp_right=[right,A(right)]
	if left==1
		index = left;
	elseif right==n
		index = right;
	else
		%barmi=[A(left),num,A(right)]
		if (A(right)+A(left)-2*num)>0
			%index='right'
			index = right;
		else
			%index='left'
			index = left;
		end
	end
end
end