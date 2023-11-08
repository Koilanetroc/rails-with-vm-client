# frozen_string_literal: true

ActiveSupport::Notifications.subscribe "process_action.action_controller" do |*args|
  event = ActiveSupport::Notifications::Event.new(*args)
  format = event.payload[:format].to_s || "all"
  format = "all" if format == "*/*"

  labels = {
    controller: event.payload[:controller],
    action: event.payload[:action],
    format: format,
    status: event.payload[:status],
    method: event.payload[:method].to_s.downcase,
    exception: event.payload[:exception]&.first # Exception class
  }

  duration_in_seconds = event.duration / 1000.0

  Metrics.increment(:rails_request_total, labels: labels)
  Metrics.measure(:rails_request_time, duration_in_seconds, labels: labels)
end
