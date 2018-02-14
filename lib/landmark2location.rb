require 'landmark2location/version'
require 'landmark2location/location'

module Landmark2location
  class << self
    def new(landmark)
      Landmark2location.new(landmark)
    end
  end
end
