nums_list = [1, 2, 3, 4]

def fn_is_even(n)
  n.even?
end

lambda_is_even = ->(n) { n.even? }

proc_is_even = Proc.new { |n| n.even? }

a = nums_list.select { |n| n.even? }

b = nums_list.select(&lambda_is_even)

c = nums_list.select(&proc_is_even)

d = nums_list.select { |n| eval "fn_is_even #{n}" }

puts "normal block results: #{a}"
puts "lambda results: #{b}"
puts "proc results: #{c}"
puts "eval results: #{d}"
