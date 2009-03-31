module MethodFinder
  def alter_match_methods(action, options = {})
    @matchable_methods ||= methods.sort
    if(action == :delete)
      options[:list].each {|i| @matchable_methods.delete(i)} if(options[:list])
    end
  end

  def match_method(params,expected, &block)
    with_warnings_suppressed do
      matchable_methods.select do |method|
        p = params
        p += ["&block"]  if block_given? && method[method.size-1,1] != '='
        test_method(method, p, expected, &block)
      end.sort
    end
  end
  
  def matchable_methods
    @matchable_methods ||= methods.sort
  end
  
  private

    # Suppresses warnings within a given block.
    def with_warnings_suppressed
      saved_verbosity = $-v
      $-v = nil
      yield
    ensure
      $-v = saved_verbosity
    end
  
    def try_clone
      begin
        clone
      rescue
        self
      end
    end
  
    def test_method(method, params, expected, &block)
      begin
        clone = try_clone
        exp = "clone.#{method}(#{params.join(',')})"
        result = eval(exp)
        result == expected    
      rescue
      end
    end 
end