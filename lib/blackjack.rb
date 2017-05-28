require_relative "card"
require_relative "deck"
require_relative "hand"

game = Hand.new

require 'pry'

puts "Welcome to Blackjack!"
puts "\nPlayer was dealt #{game.player_hand[0]}"
puts "Player was dealt #{game.player_hand[1]}"
puts "Player score: #{game.player_score}"

if game.player_score == 21
  puts "Blackjack! You win."
end

user_input = nil
while game.player_score < 22
  print "\nHit or stand (H/S): "
  user_input = gets.chomp.capitalize

  if user_input == "H"
    game.player_hit
    puts "Player was dealt #{game.player_hand[-1]}"
    puts "Player score: #{game.player_score}"
    if game.player_score > 21
      puts "Bust! Game over..."
      break
    elsif game.player_score == 21
      puts "Blackjack! You win."
      break
    end
  elsif user_input == "S"
    puts "Player score: #{game.player_score}"
    break
  else
    print "Not a valid input. Hit or stand (H/S): "
    user_input = gets.chomp.capitalize
  end
end

if game.player_score < 21
  puts "\nDealer was dealt #{game.dealer_hand[0]}"
  puts "Dealer was dealt #{game.dealer_hand[1]}"
  puts "Dealer score: #{game.dealer_score}"

  while game.player_score < 22 && game.dealer_score < 17
    game.dealer_hit
    puts "Dealer was dealt #{game.dealer_hand[-1]}"
    puts "Dealer score: #{game.dealer_score}"

    if game.dealer_score > 21
      puts "Dealer bust! You win!"
    end
  end
end

if game.player_score == game.dealer_score
  puts "\nIt's a tie!"
end

if game.player_score < 21 && game.dealer_score < 21
  if game.player_score > game.dealer_score
    puts "Player wins!"
  elsif game.player_score < game.dealer_score
    puts "Dealer wins!"
  end
end
