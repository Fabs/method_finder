module Kernel
  # Suppresses warnings within a given block.
  def with_warnings_suppressed
    saved_verbosity = $-v
    $-v = nil
    yield
  ensure
    $-v = saved_verbosity
  end

  def match_method(object,params,expected)
    with_warnings_suppressed do
      object.methods.select do |method|
        begin
          clone = object
          begin
            clone = object.clone
          rescue
          end
          exp = "clone.#{method}(#{params.join(',')})"
          result = eval(exp)
          result == expected
        rescue
        end        
      end.sort
    end
  end

end