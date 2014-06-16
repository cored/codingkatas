module Syncronizer
  class Friend 
    attr_reader :id, :name
    def initialize(id, name) 
      @id = id 
      @name = name
    end
  end

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

    def count 
      @friends.count
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
end
