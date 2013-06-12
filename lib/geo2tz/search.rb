require 'kdtree'
require 'active_support/time_with_zone'
module Geo2tz
  class Search
    
    MAP = {}
    
    def self.lat_long(lat, long)
      tz_integer = self.kdtree.nearest(lat, long)
      ActiveSupport::TimeZone.new(MAP.invert[tz_integer])
    end

    private

    def self.setup_tree
      points = []
      File.open("#{Geo2tz.config[:writable_directory]}/#{Geo2tz.config[:filename]}").each do |line|
        data = line.split(',')
        tz = data[2].strip
        unless MAP.has_key? tz
          MAP[tz] = MAP.size
        end
        points << [data[0].to_f, data[1].to_f, MAP[tz]]
      end
      Kdtree.new(points)
    end

    def self.kdtree
      @kd ||= setup_tree
    end

  end
end
