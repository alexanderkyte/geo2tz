require "geo2tz/version"
require 'geo2tz/data_fetcher'
require 'geo2tz/railtie' if defined?(Rails)

module Geo2tz
  MAP = {}
  
  class Base
      
    def self.kdtree
      
      unless @kd
        
        points = []
        
        File.open(Rails.root.to_path+ "/files/cities1000_parsed.txt").each do |line|

          data = line.split(',')
          tz = data[2].strip

          unless MAP.has_key? tz
            MAP[tz] = MAP.size
          end

          points << [data[0].to_f, data[1].to_f, MAP[tz]]
        end

        @kd = Kdtree.new(points)

      end

      @kd

    end

    def self.timezone_by_latlong(lat, long)
      tz_integer = self.kdtree.nearest(lat, long)
      ActiveSupport::TimeZone.new(MAP.invert[tz_integer])
    end

  end

end