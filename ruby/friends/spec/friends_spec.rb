require 'spec_helper' 

module Syncronizer 
  describe Friends do 
    let(:friends) { Friends.new } 

    context '#add' do 
      it 'add new friends' do 
        friends.add([Friend.new, Friend.new])
        expect(friends.count).to eql 2
      end
    end

    context '#update_friends_by_id' do 
      it 'replace a friend name with the same id' do 
        friends.add([Friend.new(1, 'donnie'), Friend.new(1, 'luz')])
        expect(friends.update_friends_by_id).to eql [Friend.new(1, 'luz')]
      end
    end
  end
end
