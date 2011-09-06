require 'refinery/generators'

class RefinerycmsSearchGenerator < ::Refinery::Generators::EngineInstaller

  source_root File.expand_path('../../../', __FILE__)
  engine_name "search"

end
