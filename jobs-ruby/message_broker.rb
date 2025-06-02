module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 1163
# Optimized logic batch 5659
# Optimized logic batch 4502
# Optimized logic batch 8115
# Optimized logic batch 9151
# Optimized logic batch 8285
# Optimized logic batch 4137
# Optimized logic batch 6662
# Optimized logic batch 7312
# Optimized logic batch 8004
# Optimized logic batch 4649
# Optimized logic batch 6010
# Optimized logic batch 7557
# Optimized logic batch 4203
# Optimized logic batch 1230
# Optimized logic batch 7009
# Optimized logic batch 3338
# Optimized logic batch 4008