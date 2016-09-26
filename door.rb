module House
  class Door
    attr_reader :door_message, :is_locked, :is_closed

    def initialize
      @door_message = ""
      @is_locked = false
      @is_closed = true
    end

    def locked?
      @is_locked
    end

    def closed?
      @is_closed
    end

    def inscription(phrase)
      if @door_message == ""
        if @is_closed == true
          @door_message = phrase
          return @door_message
        else
          return "Cannot write on a door that is open!"
        end
      else
        return "Can write on door once."
      end
    end

    # def inscription
    #   if @door_message == ""
    #     return "Nothing has been written yet."
    #   else
    #     return @door_message
    #   end
    # end

    def open
      if @is_closed == true && @is_locked == false
          @is_closed = false
          return "Door is now open"
      elsif @is_closed == true && @is_locked == true
        return "Door is locked"
      elsif @is_closed ==false && @is_locked == true || @is_locked ==false
          return "Door is already open"
      end
    end

    def close
      if @is_closed == false
        @is_closed = true
        return "Door is now closed"
      else
        return "Door is already closed"
      end
    end

    def lock
      if @is_locked == false
        @is_locked = true
        return "Door is now locked"
      else
        return "Door is already locked"
      end
    end

    def unlock
      if @is_locked == true
        @is_locked = false
        return "Door is now unlocked"
      else
        return "Door is already unlocked"
      end
    end
  end
end
