require "method_finder"
class Object
  include MethodFinder
end

module Enumerable 
  include MethodFinder
  
  def matchable_methods    
    super.select {|m| m != "cycle"}
  end
    
  def append_features
    alter_match_methods :delete, :list => ["cycle"]    
    super()
  end 
end