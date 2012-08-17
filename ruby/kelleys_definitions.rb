# Ruby quirks quiz by Colin Kelley
# Try and guess the values printed at the end first!

names = "John Doe".split( ' ' )
first_name, last_name = names
middle_name_count = names.size - 2

first_last_initial = "#{first_name} #{'...' if middle_name_count} #{last_name[0]}"

found = middle_name_count or (first_name.downcase! == 'jane') and (last_name.downcase! == 'doe')

if found
  found_flag     = true
else
  not_found_flag = true
end

found_string     = 'Happy!\n' if defined? found_flag
not_found_string = 'Sad.\n'   if defined? not_found_flag

puts [first_name, last_name, first_last_initial, found, found_string, not_found_string].inspect
