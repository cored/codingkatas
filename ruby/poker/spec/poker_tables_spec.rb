require 'spec_helper'

describe 'Poker Tables' do 
  context 'NL Royal Table' do 
    let(:royal_table) { RoyalTable.new(:nl, 'ring') } 
    it 'should deal hole cards' do 
      royal_table.deal_hole_cards.size.should == 2 
    end

    it 'should deal board cards' do 
      royal_table.deal_board_cards.size.should == 5
    end

    it 'should return min_raise for nl' do 
     royal_table.min_raise.should == 20
    end
     
    it 'should return max_raise for nl' do 
      royal_table.max_raise.should == 300
    end

    it 'should return type' do 
      royal_table.type.should == 'ring'
    end
  end

  context 'PL Royal Table' do 
    let(:royal_table) { RoyalTable.new(:pl, 'ring') } 
    it 'should return min_raise for pl' do 
     royal_table.min_raise.should == 20
    end
     
    it 'should return max_raise for pl' do 
      royal_table.max_raise.should == 200
    end
  end

  context 'FL Royal Table' do 
    let(:royal_table) { RoyalTable.new(:fl, 'ring') } 
    it 'should return min_raise for fl' do 
     royal_table.min_raise.should == 100 
    end
     
    it 'should return max_raise for fl' do 
      royal_table.max_raise.should == 100
    end
  end

  context 'NL Holdem Table' do 
    let(:holdem_table) { HoldemTable.new(:nl, 'ring') } 
    it 'should return min_raise for nl' do 
     holdem_table.min_raise.should == 20 
    end
     
    it 'should return max_raise for nl' do 
      holdem_table.max_raise.should == 300
    end
  end

  context 'PL Holdem Table' do 
    let(:holdem_table) { HoldemTable.new(:pl, 'ring') } 
    it 'should return min_raise for pl' do 
     holdem_table.min_raise.should == 20 
    end
     
    it 'should return max_raise for pl' do 
      holdem_table.max_raise.should == 200
    end
  end

  context 'FL Holdem Table' do 
    let(:holdem_table) { HoldemTable.new(:fl, 'ring') } 
    it 'should return min_raise for pl' do 
     holdem_table.min_raise.should == 100 
    end
     
    it 'should return max_raise for pl' do 
      holdem_table.max_raise.should == 100
    end
  end

end
