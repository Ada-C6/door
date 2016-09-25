

module DoorErrors

  class StatusError < StandardError
  end

  class LStatusError < StandardError
  end

  class InscriptionError < StandardError
  end


end

require_relative 'lib/door'
