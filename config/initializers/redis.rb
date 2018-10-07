# frozen_string_literal: true

redis_connection = Redis.new(
  url: ENV['REDIS_URL'],
  driver: :hiredis
)

namespace = ENV.fetch('REDIS_NAMESPACE') { nil }

Redis.current = if namespace
  Redis::Namespace.new(namespace, redis: redis_connection)
else
  redis_connection
                end
