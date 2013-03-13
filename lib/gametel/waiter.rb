module Gametel
  module Waiter
    class Timeout < StandardError; end

    def wait_until(timeout=10, &block)
      last_call = ::Time.now + timeout
      while ::Time.now < last_call
        stoppit = block.call if block
        return if stoppit
        sleep 0.1
      end

      raise Timeout
    end
  end
end
