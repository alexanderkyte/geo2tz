# Geo2tz

This gem enables you to find a timezone given a set of latitude and longitude.

In order to do that It parses a list of all the cities from geonames.org and setup a Kdtree to find to closest city to your given coordinates and returns the associated timezone.

## Installation

Add this line to your application's Gemfile:

    gem 'geo2tz'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo2tz

## Usage

In order to work this gem needs to download, parse and store a file from geonames.org. It therefore needs to store that file somewhere. you need to specify a writable directory where It can write to.

	# config/initializers/geo2tz.rb
	Geo2tz.configure(
	  :writable_directory => '/myproject/files,
	  :filename => 'geo2tz.db' # Optional,
	  :geoname_url => 'http://download.geonames.org/export/dump/cities1000.zip',
	  :geoname_filename => 'cities1000.txt'
	)

To setup your cities database file.

	Geo2tz::Updater.new

To search use the lat_long method

	Geo2tz::Search.lat_long(-18,31)
	=> (GMT+02:00) Africa/Harare

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
