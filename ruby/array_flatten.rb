# A few variations of Ruby's Flatten... each one progressively getting better...

# Variation #1 Mike

def mikes_flatten arr, level = nil
  result = []
  arr.each do |elem|
    recursive_flatten(result, elem,level,0)
  end
  result
end
 
def recursive_flatten(result, elem,level,current_level)
  if elem.is_a?(Array)
    elem.each do |el|
      if level.nil? || current_level &lt; level
        recursive_flatten(result, el,level,current_level+1)
      else
        result &lt;&lt; el
      end
    end
  else
    result &lt;&lt; elem
  end
  result
end

# Variation 2 Jon

def flatten values, level=-1
  flat = []
  values.each do |value|
    if level != 0 &amp;&amp; value.kind_of?(Array)
      flat.concat(flatten(value, level-1))
    else
      flat &lt;&lt; value
    end
  end
  flat
end


### Some Perf Code
=begin
#!/usr/bin/ruby
require 'benchmark'
 
# Insert flatten methods here
 
def random_value
  if rand(3) &lt; 1
    (rand(5)+1).times.map { |i| random_value }
  else
    rand(10000)
  end
end
 
VALUE = 100.times.map { |i| random_value}
ITERATIONS = 1000
 
Benchmark.bm do |b|
  puts "Iterations: #{ITERATIONS}"
  b.report("Mikes version") do
    ITERATIONS.times { |i| mikes_flatten(VALUE)}
  end
  b.report("Jons version") do
    ITERATIONS.times { |i| flatten(VALUE)}
  end
end
=end

# And finally, Variation #3 Colin

def flatten(array, result = [])
	array.each do |el|
		case el
		when Array
			flatten el, result
		else
			result << el
		end
	end
	result
end
