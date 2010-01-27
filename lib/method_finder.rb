RSPEC_ADDED_METHODS = ["should_receive", "should_not_receive", "stub!", "stub", "unstub", "unstub!", "stub_chain", "debugger"]
FORBIDDEN_METHODS = ["match_method", "cycle", "display"] | RSPEC_ADDED_METHODS

class Object
  def match_method(params, expected, &block)
    with_warnings_suppressed do
      methods.select do |method|
        unless FORBIDDEN_METHODS.member? method
          test_method(method, params, expected, &block)
        end
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
  
    def test_method(method, params, expected, &block)
      begin
        clone = try_clone
        result = clone.send(method, *params, &block)
        result == expected
      rescue
        false
      end
    end
  
    def try_clone
      begin
        clone
      rescue
        self
      end
    end
end