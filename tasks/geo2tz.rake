desc 'Geo2tz data fetching'
task :fetch_geodata do
  Geo2tz::Updater.new
end