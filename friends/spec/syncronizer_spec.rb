require 'spec_helper'
class Service; end

describe Syncronizer do 
  context 'syncronize two lists' do 
    it 'add friends not present' do 
      Service.stub(:retrieve_friends) { '{ "friends" : [ {"id":"1", "name":"jack"}, {"id":"2", "name":"john"} ] }' }

      Syncronizer.call.first.name.should == 'jack'
    end

    it 'updates existing friends names based on id' do 
      Service.stub(:retrieve_friends) { '{ "friends" : [ {"id":"1", "name":"jack"}, {"id":"2", "name":"john"} ] }' }

      Syncronizer.call

      Service.stub(:retrieve_friends) { '{ "friends" : [ {"id":"1", "name":"bob"}, {"id":"2", "name":"john"} ] }' }

      friends = Syncronizer.call
      friends.first.name.should == 'bob'
      friends.size.should == 2
    end

    it 'delete local friends that are not present in the response' do 
      Service.stub(:retrieve_friends) { '{ "friends" : [ {"id":"1", "name":"jack"}, {"id":"2", "name":"john"} ] }' }

      Syncronizer.call

      Service.stub(:retrieve_friends) { '{ "friends" : [ {"id":"2", "name":"molly"} ] }' }

      friends = Syncronizer.call
      friends.first.name.should == 'molly'
      friends.size.should == 1
    end
  end
end
