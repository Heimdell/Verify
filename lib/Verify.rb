require "Verify/version"

module Verify
  autoload :Assumption, 'Verify/assumption'
  autoload :Loader,     'Verify/loader'

  def self.assumptions(directory = 'assumptions')
    Loader.run directory
  end
end
