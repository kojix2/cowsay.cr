require "./abstract_cow"

module Cowsay
  class Bunny < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}   \\
        \\ /\\
        ( )
      .( o ).

COW
    end
  end
end
