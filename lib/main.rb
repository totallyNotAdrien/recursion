#returns the first n numbers of the fibonacci sequence
def fibs(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  pprev = 0
  prev = 1
  seq = [pprev, prev]
  while seq.length < n
    new_fib = pprev + prev
    seq << new_fib

    pprev = prev
    prev = new_fib
  end
  seq
end

#returns the first n numbers of the fibonacci sequence
def fibs_recursive(n)
  return [0] if n <= 1
  return [0, 1] if n == 2
  arr = fibs_recursive(n - 1)
  return arr << (arr[-1] + arr[-2])
end

puts "first 10 fib nums, iteratively: #{fibs(10)}"
puts "first 10 fib nums, recursively: #{fibs_recursive(10)}"

def merge_sort(arr)
  return arr if arr.length < 2

  left = arr.slice!(0, arr.length / 2)
  right = arr
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  merge(sorted_left, sorted_right)
end

def merge(larr, rarr)
  ret_arr = []
  left_index = 0
  right_index = 0
  until left_index >= larr.length && right_index >= rarr.length
    left = larr[left_index]
    right = rarr[right_index]
    if left && right
      if left < right
        ret_arr << left
        left_index += 1
      else
        ret_arr << right
        right_index += 1
      end
    elsif left && !right
      ret_arr << left
      left_index += 1
    elsif right && !left
      ret_arr << right
      right_index += 1
    end
  end
  ret_arr
end

unsorted_array = []
15.times { unsorted_array << rand(50) }

puts "array to sort: #{unsorted_array}"
puts "sorted  array: #{merge_sort(unsorted_array)}"
