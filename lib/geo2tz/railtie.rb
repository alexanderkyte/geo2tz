require 'geo2tz'
require 'rails'
module Geo2tz
  class Railtie < Rails::Railtie
    railtie_name :geo2tz

    rake_tasks do
      load "tasks/geo2tz.rake"
    end
  end
end
