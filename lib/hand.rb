require_relative 'deck'

class Hand
  attr_reader :player_hand, :dealer_hand, :player_score, :dealer_score

  def initialize
    @hand_deck = Deck.new
    @player_hand = @hand_deck.deal(2)
    @dealer_hand = @hand_deck.deal(2)
  end

  def player_score
    player_score = 0
      @player_hand.each do |card|
        if card.include?("J") || card.include?("Q") || card.include?("K")
          player_score += 10
        elsif card.include?("A") && player_score < 11
          player_score += 11
        elsif card.include?("A") && player_score >= 11
          player_score += 1
        else
          player_score += card.to_i
        end
      end

      @player_hand.each do |card|
        if player_score > 21 && card.include?("A")
          player_score -= 10
        end
      end
    player_score
  end

  def dealer_score
    dealer_score = 0
      @dealer_hand.each do |card|
        if card.include?("J") || card.include?("Q") || card.include?("K")
          dealer_score += 10
        elsif card.include?("A") && dealer_score < 11
          dealer_score += 11
        elsif card.include?("A") && dealer_score >= 11
          dealer_score += 1
        else
          dealer_score += card.to_i
        end
      end

      @dealer_hand.each do |card|
        if dealer_score > 21 && card.include?("A")
          dealer_score -= 10
        end
      end
    dealer_score
    end

    def player_hit
      @player_hand += @hand_deck.deal(1)
      self.player_score
    end

    def dealer_hit
      @dealer_hand += @hand_deck.deal(1)
      self.dealer_score
    end
end
