class Door
    attr_reader :inscription, :position, :security

    def initialize(inscription)
        @inscription = inscription
        @position = "closed"
        @security = "locked"
    end
    # please note: a door's position has to be either open or closed and it's security status is either locked or unlocked, so since these instance variables needed default values, I arbitrarily decided to initiate all doors as closed and locked at the time of the door object's creation.

    def unlock
        if @security == "locked"
            @security = "unlocked"
            return self
        else
            raise ArgumentError.new("you can only unlock a door that is locked")
        end
    end

    def lock
        if @security == "unlocked"
            @security = "locked"
            return self
        else
            raise ArgumentError.new("you can only lock a door that is unlocked")
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

    def writing
        if @inscription == "" || @inscription == nil
            raise ArgumentError.new("there is no inscription on this door")
        else
            return @inscription
        end
    end

    def closed?
        return true if @position == "closed"; false
    end
end

# puts Door.new("").writing
