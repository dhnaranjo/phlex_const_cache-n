require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.push_dir("lib/thing")
loader.setup

module Thing
end

loader.eager_load
