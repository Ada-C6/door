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
            raise ArgumentError.new("you can only unlock a door that is locked")
        end
    end

    def open
        if @position == "closed" && @security == "unlocked"
            @position = "open"
            return self
        else
            raise ArgumentError.new("you can only open a door that is closed and unlocked")
        end
    end

    def close
        if @position == "open"
            @position = "closed"
            return self
        else
            raise ArgumentError.new("you can only close a doors that is open")
        end
    end
end

# puts d = Door.new("hello").unlock.unlock
