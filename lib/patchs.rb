require "method_finder"

class Object
  include MethodFinder
end

module Enumerable
  def append_features
    alter_match_methods :delete, ["cycle"]
    super()
  end 
end