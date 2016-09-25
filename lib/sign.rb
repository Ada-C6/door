# module Dungeon
#   # Plan to refactor to not use this class at all for this assignment
#   class Sign
#
#     attr_reader :inscription
#
#     def initialize(inscription = nil)
#       if inscription.class != String && inscription != nil
#         raise ArgumentError.new("The inscription needs to be a string or nil")
#       end
#
#       @inscription = inscription
#     end
#
#     # Here the method will not return @inscription unless it is changed. Is that bad practice or ok? What does it return?
#     def inscribe(words)
#       if words.class == String && words != ""
#         if @inscription == nil
#           @inscription = words
#         else
#           puts "There is already an inscription and it cannot be changed."
#         end
#       end
#       return @inscription
#     end
#
#   end
# end
