module Kernel

  def match_method(object,params,expected, &block)
    params << "&block" if block_given?
    with_warnings_suppressed do
      object.methods.select do |method|
        test_method(method, object, params, expected, &block)
      end.sort
    end
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
  
    def try_clone(object)
      begin
        object.clone
      rescue
        object
      end
    end
  
    def test_method(method, object, params, expected, &block)
      begin
        clone = try_clone object
        exp = "clone.#{method}(#{params.join(',')})"
        result = eval(exp)
        result == expected    
      rescue
      end
    end
    
end