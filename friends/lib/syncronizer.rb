require 'json'

Friend = Struct.new(:id, :name)

class Friends
  def initialize 
    @friends = []
  end

  def add(friends)
    @friends += friends 
  end

  def update_friends_by_id
    resulted_friends = []
    @friends.group_by(&:id).map do |id, friends| 
      resulted_friends << replace_friend_by_id(friends)
    end.flatten
    @friends = resulted_friends.flatten
  end

  def remove_friends_not_in(friends)
    @friends.keep_if { |friend| any_friend_id_equal_to(friends, friend.id) }
  end

  private 
  def any_friend_id_equal_to(friends, id)
    friends.any? { |fr| fr.id == id } 
  end

  def replace_friend_by_id(friends)
    if friends.size > 1
      friends[0] = friends[1] 
      friends.delete_at 1
    else 
      friends
    end
  end
end

class Syncronizer
  def initialize
    @friends = Friends.new
  end

  def perform
    @friends.add friend_response
    @friends.update_friends_by_id
    @friends.remove_friends_not_in(friend_response)
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
