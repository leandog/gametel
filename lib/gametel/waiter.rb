module Gametel
  module Waiter
    class Timeout < StandardError
      def initialize(waiting_for=nil)
        super(waiting_for)
        @waiting_for = waiting_for
      end

      def to_s
        return super unless @waiting_for
        "Timed out waiting for #{@waiting_for}"
      end
    end

    def wait_until(timeout=10, message=nil, &block)
      last_call = ::Time.now + timeout
      while ::Time.now < last_call
        stoppit = block.call if block
        return if stoppit
        sleep 0.1
      end

      raise Timeout.new message
    end
  end
end
