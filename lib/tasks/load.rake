# frozen_string_literal: true

require 'net/http'

namespace :load do
  desc 'Requests our api in a loop'
  task generator: :environment do
    puts 'starting requesting api'

    10000.times do |i|
      Net::HTTP.get(URI('http://0.0.0.0:3000/posts'))
      Net::HTTP.get(URI('http://0.0.0.0:3000/posts'))

      # create a new one
      Net::HTTP.post URI('http://0.0.0.0:3000/posts'),
               { post: { title: "Some Title", body: "Some body"}}.to_json,
               "Content-Type" => "application/json"
    end
  end
end
