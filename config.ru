# frozen_string_literal: true

require_relative 'config/environment'

require 'prometheus/middleware/exporter'

use Prometheus::Middleware::Exporter

run Rails.application
