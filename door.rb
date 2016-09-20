class Door
    attr_reader :inscription, :position
    attr_accessor :security

    def initialize(inscription)
        @inscription = inscription
        @position = "closed"
        @security = "locked"
    end

    def unlock
        # if @security == "locked"
            return @security = "unlocked"
        # else
        #     raise ArgumentError.new("you can only unlock doors that are locked")
        # end
    end
end

d = Door.new("hello").unlock
puts "\nThis is weird, it shows d is:"
puts d
puts "\nI want d's security instance variable to be unlocked, not the instance object itself. What am I forgetting?"
print d.security
