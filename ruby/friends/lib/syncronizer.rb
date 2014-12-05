require 'json'
require_relative 'syncronizer/friends'

module Syncronizer
  extend self

  def call
    friends = Friends.new
    friends.add friend_response
    friends.update_friends_by_id
    friends.remove_friends_not_in(friend_response)
  end

  def service 
    Service
  end

  private 

  def friend_response 
    parse_service_response
  end

  def parse_service_response 
    JSON.parse(service.retrieve_friends)["friends"].map do |friend|
      Friend.new(friend['id'], friend['name'])
    end
  end
end
