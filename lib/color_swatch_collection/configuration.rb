# frozen_string_literal: true

module ColorSwatchCollection
  class Configuration
    attr_accessor :default_collection_picks, :default_collection_omits

    def initialize
      @default_collection_picks = [] # Empty by default
      @default_collection_omits = [] # Empty by default
    end

    def reset!
      @default_collection_picks = []
      @default_collection_omits = []
    end
  end

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset_configuration!
      @configuration = Configuration.new
    end
  end
end
