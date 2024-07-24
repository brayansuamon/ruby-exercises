dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string, dictionary)
  string.downcase!
  dictionary.reduce(Hash.new(0)) do |hash, word|
    puts "word: #{word} hash: #{hash}"
    count = string.scan(word).length
    hash[word] = count if count > 0
    hash
  end
end

result = substrings("below", dictionary)
puts result
#  { "below" => 1, "low" => 1 }
#  


def substrings2(strings, dictionary)
  result = {}
  strings.each do |string|
    string.downcase!
    dictionary.each do |word|
      count = string.scan(word).length
      result[word] ||= 0
      result[word] += count if count > 0
    end
  end
  result
end

result2 = substrings2(["Howdy partner, sit down! How's it going?", "Elements"], dictionary)
puts result2

def stock_picker(prices)
  max_profit = 0
  best_days = []

  prices.each_with_index do |buy_price, buy_day|
    prices[buy_day+1..-1].each_with_index do |sell_price, sell_day|
      profit = sell_price - buy_price
      if profit > max_profit
        max_profit = profit
        best_days = [buy_day, sell_day + buy_day + 1]
      end
    end
  end

  best_days
end

stock_picker([17,3,6,9,15,8,6,1,10])
