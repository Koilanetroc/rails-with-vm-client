# README

Example rails app with [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics) and [vm-client](https://github.com/Koilanetroc/vm-client).  

Read the [full guide on Hackernoon](https://hackernoon.com/unleashing-vm-histograms-for-ruby-migrating-from-prometheus-to-victoriametrics-with-vm-client).

# Setup
To start the app run the following commands:
- Start app with all deps  
  `docker compose up`
- Create and migrate db  
  `docker compose exec web bin/rails db:create db:migrate`
- Run rake task for generating metrics for a few minutes  
  `docker compose exec web bundle exec rake load:generator`
- Go to http://0.0.0.0:3000/metrics and check metrics collected by [vm-client](https://github.com/Koilanetroc/vm-client)

## Versions
- Ruby 3.2.0
- Rails 7.1.1
- Docker version 20.10.23 
