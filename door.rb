class Door
    attr_accessor :inscription, :ajar, :unlocked
    def initialize(inscription=nil, ajar=true, unlocked=true)
      @inscription = inscription
      @ajar = ajar
      @unlocked = unlocked
    end

    # Once the writing (inscription) on a Door is set, it cannot be changed
    def inscribe
      if @inscription==nil
        puts "Please type your inscription."
        @inscription = gets.chomp.upcase
        puts "wise choice, this door shall, forever more, be named #{@inscription}"
      elsif @inscription != nil
        raise ArgumentError.new("The Door is named! #{@inscription} door cannot be changed!")
      end
    end

    # You may open a Door if and only if it is unlocked and closed
    def access
      if @ajar == true || if @unlocked == false
        raise ArgumentError.new("Further permissions required")
      elsif @ajar == false && if @unlocked == true
        puts "your wish is granted"
      return @ajar = true
      end
      end
      end
    end

    # You may close a Door if and only if it is open
    def close
      if @ajar == false
        raise ArgumentError.new("The path you seek is redundant")
      else
        puts "Door Closure Completed"
        return @ajar = false
      end
    end

    # You may lock a Door if and only if it is unlocked
    def lock
      if @unlocked == false
        raise Exception.new("a locked door needith not to be locked")
      else
        return @unlocked = false
      end
    end

    # You may unlock a Door if and only if it is locked
    def unlock
      if @unlocked == true
        raise ExceptionError.new("An unlocked door needith not be unlocked")
      else
        return @unlocked = true
      end
    end
    # You should be able to check whether or not a Door is closed
    def open_status?
     return @ajar == true
    end

    # check whether or not it is locked
    def lock_status?
     return @unlocked == true
    end

    # look at the writing on the Door if any
    def name
      return @inscription
    end
end
