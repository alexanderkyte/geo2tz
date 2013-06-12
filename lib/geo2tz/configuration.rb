require 'singleton'
module Geo2tz
  
  def self.configure(options)
    Configuration.instance.configure(options)
  end

  def self.config
    Configuration.instance.data
  end

  class Configuration
    
    include Singleton
    
    attr_accessor :data

    OPTIONS = [
      :writable_directory,
      :filename,
      :geoname_url,
      :geoname_filename
    ]

    def initialize
      @data = {}
      set_defaults
    end

    def configure(options)
      @data.merge!(options)
    end

    def set_defaults
      @data[:filename] = "geo2tz.db"
      @data[:writable_directory] = "/tmp"
      @data[:geoname_url] = "http://download.geonames.org/export/dump/cities1000.zip"
      @data[:geoname_filename] = "cities1000.txt"
    end
    
    OPTIONS.each do |o|
      define_method o do
        @data[o]
      end
      define_method "#{o}=" do |value|
        @data[o] = value
      end
    end

  end
end
