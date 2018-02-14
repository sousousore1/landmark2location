require 'net/http'
require 'json'

module Landmark2location
  class Location
    attr_reader :landmark

    def initialize(landmark)
      @landmark = landmark
    end

    def ok?
      status == 'OK'
    end

    def get_postal_codes
      return [] unless ok?
      postal_codes = []
      results.each do |result|
        result['address_components'].each do |address_component|
          next unless address_component['types'].include? 'postal_code'
          postal_codes << address_component['long_name']
        end
      end
      postal_codes
    end

    def get_formatted_addresses
      return [] unless ok?
      formatted_addresses = []
      results.each do |result|
        formatted_addresses << result['formatted_address']
      end
      formatted_addresses
    end

    private

    def uri
      URI.parse(URI.encode("https://maps.googleapis.com/maps/api/geocode/json?address=#{landmark}"))
    end

    def response
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Accept-Language'] = 'ja,en-US;q=0.9,en;q=0.8'
      https.request(request)
    end

    def json
      @json ||= JSON.parse(response.body)
    end

    def results
      @results ||= json['results']
    end

    def status
      @status ||= json['status']
    end
  end
end