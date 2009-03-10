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
    answer = []
    with_warnings_suppressed do
      answer.collect!{|i| i.to_s if i.class == Fixnum}
      object.methods.sort.each do | method | 
        begin
          clone = object
          begin
            clone = object.clone
          rescue
          end
          exp = "clone.#{method}(#{params.join(',')})"
          result = eval(exp)
          answer << method if result == expected
        rescue
        end
      end
    end
    return answer.sort
  end

end