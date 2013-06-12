require 'open-uri'
require 'zip/zip'
module Geo2tz
  class Updater
  	
    def initialize
      unzip_db
      parse_cities
      write_file
  	end

    def unzip_db
      puts "Downloading #{Geo2tz.config[:geoname_url]}."
      open(Geo2tz.config[:geoname_url]) do |zf|
        puts "Done."
        zipfile = Zip::ZipFile.open(zf.path)
        if zipfile.find_entry(Geo2tz.config[:geoname_filename])
          @unparsed_cities = zipfile.read(Geo2tz.config[:geoname_filename])
        else
          raise "Zip file does not contain expected file"
        end
      end
      true
    end

    def parse_cities
      @parsed_cities = []
      @unparsed_cities.split("\n").each do |line|
        line_data = line.split("\t")
        @parsed_cities << {:lat => line_data[4], :long => line_data[5], :tz => line_data[17]}
      end
      true
    end

    def write_file
      File.open("#{Geo2tz.config[:writable_directory]}/#{Geo2tz.config[:filename]}", 'w') do |file|
        @parsed_cities.each do |city|
          file.write("#{city[:lat]},#{city[:long]},#{city[:tz]}\n")
        end
      end
      true
    end

  end
end
