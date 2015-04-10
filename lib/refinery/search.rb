require 'refinerycms-core'
require 'refinerycms-acts-as-indexed'

module Refinery
  autoload :SearchGenerator, 'generators/refinery/search/search_generator'

  module Search
    require 'refinery/search/engine'
    require 'refinery/search/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end
