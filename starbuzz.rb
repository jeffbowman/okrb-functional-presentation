
regular_url = ->() {"http://www.beans-r-us.biz/prices.html"}
discount_url = ->() {"http://www.beans-r-us.biz/prices-loyalty.html"}

def discount_url_fn
  discount_url.call
end

def regular_url_fn
  regular_url.call
end

def get_price_url_with_fn(url_fn)
  url_fn.call
end

def get_price_url_with_lambda(url_fn)
  url_fn.call
end

puts "#{get_price_url_with_fn(&:discount_url_fn)}"
puts "#{get_price_url_with_fn(&:regular_url_fn)}"
puts "#{get_price_url_with_lambda(discount_url)}"
puts "#{get_price_url_with_lambda(regular_url)}"

