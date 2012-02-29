require "refinerycms-core"

module Refinery
  autoload :SearchGenerator, File.expand_path('../generators/refinery/search_generator', __FILE__)

  module Search
    require "refinery/search/engine"

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
    end
  end
end

