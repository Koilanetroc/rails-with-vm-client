# frozen_string_literal: true

class Metrics
  class << self
    def increment(name, by: 1, labels: {})
      find_or_create_metric(:counter, name, labels: labels).increment(by: by, labels: labels)
    end

    def measure(name, value, labels: {})
      find_or_create_metric(:vm_histogram, name, labels: labels).observe(value, labels: labels)
    end

    private

    def find_or_create_metric(method, name, labels:)
      metric = Prometheus::Client.registry.get(name)
      return metric if metric

      Prometheus::Client.registry.method(method).call(name, docstring: 'metric', labels: labels.keys)
    end
  end
end
