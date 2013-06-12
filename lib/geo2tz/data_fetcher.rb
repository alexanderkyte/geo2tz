require 'geo2tz'
require 'open-uri'
require 'zip/zip'
module Geo2tz
  class DataFetcher

    DB_URL = "http://download.geonames.org/export/dump/cities1000.zip"
    FILENAME = "cities1000.txt"
  	
    def initialize
      unzip_db
      parse_cities
      write_file
  	end

    def unzip_db
      p "Downloading #{DB_URL}."
      open(DB_URL) do |zf|
        p "Done."
        zipfile = Zip::ZipFile.open(zf.path)
        if zipfile.find_entry(FILENAME)
          @unparsed_cities = zipfile.read(FILENAME)
        else
          raise "Zip file does not contain expected file"
        end
      end
    end

    def parse_cities
      @parsed_cities = []
      @unparsed_cities.split("\n").each do |line|
        line_data = line.split("\t")
        @parse_cities << {:lat => line_data[4], :long => line_data[5], :tz => line_data[17]}
      end
    end

    def write_file
      
    end

  end
end
