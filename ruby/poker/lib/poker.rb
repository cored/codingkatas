Suit = Struct.new(:rank, :suit)

class PokerTable 
  MIN_RAISE =  {nl:20, pl:20, fl:100}
  MAX_RAISE = {nl:300, pl:200, fl:100}
  SUITS = %w|s h d c|

  attr_reader :type
  def initialize(beting_type, type)
    @beting_type = beting_type
    @type = type
  end

  def min_raise 
    MIN_RAISE[@beting_type]
  end

  def max_raise 
    MAX_RAISE[@beting_type]
  end
end

class RoyalTable < PokerTable
  DECK = (10..14)

  def deal_hole_cards
    deck.take(2)
  end

  def deal_board_cards
    deck.take(5)
  end

  def deck 
    DECK.map do |deck|
      Suit.new(deck, SUITS.sample)
    end
  end
end

class HoldemTable < RoyalTable
  DECK = (2..14)
end

