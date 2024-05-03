require "../abstract_cow"

module Cowsay
  class MechAndCow < AbstractCow
    def render_cow
      <<-COW

COW
    end
  end
end
