class Door
    attr_reader :inscription, :position
    attr_accessor :security

    def initialize(inscription)
        @inscription = inscription
        @position = "closed"
        @security = "locked"
    end

    def unlock
        if @security == "locked"
            @security = "unlocked"
            return self
        else
            raise ArgumentError.new("you can only unlock doors that are locked")
        end
    end
end

# puts d = Door.new("hello").unlock.unlock
