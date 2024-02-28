# Chaining methods on enumerators
(0..10).select { |i| i % 2 == 0 }.map { |i| i*i }

# Show problem
(0..10).reverse_each.select { |i| i % 2 == 0 }.map { |i| 100/i }.first
(0..10).lazy.reverse_each.select { |i| i % 2 == 0 }.map { |i| 100/i }.first


(0..10).reverse_each.map { |i| 100/i }.any? { |i| i == 10 }
(0..10).lazy.reverse_each.map { |i| 100/i }.any? { |i| i == 10 }

# Will hang
(1..Float::INFINITY).reject { |i| i.odd? }.map { |i| i*i }.first(5)
(1..Float::INFINITY).lazy.reject { |i| i.odd? }.map { |i| i*i }.first(5)

# Based on the real code
def get_page(page_number)
  if page_number <= 2
    puts "Fetching page #{page_number}"
    (1..10).map { |_i| page_number*100+_i }
  else
    []
  end
end

custom_enumerator = Enumerator.new do |yielder|
  page_number = 1
  current_page = []

  loop do
    if current_page.empty?
      current_page = get_page(page_number)
      page_number += 1
    end

    raise StopIteration if current_page.empty?

    yielder << current_page.shift
  end
end
