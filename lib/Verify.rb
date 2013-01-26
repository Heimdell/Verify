require "Verify/version"

module Verify
  autoload :Assumption, 'Verify/assumption'
  autoload :Loader,     'Verify/loader'

  def self.assumptions(file_mask = "assumptions/**/*_assumption.rb")
    Loader.new.load file_mask
  end
end
