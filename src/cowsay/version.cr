require "./abstract_cow"

module Cowsay
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end
