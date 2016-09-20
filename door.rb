class Door
    attr_reader :inscription, :position, :security

    def initialize(inscription)
        @inscription = inscription
        @position = "closed"
        @security = "locked"
    end
end
