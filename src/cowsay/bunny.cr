require "./abstract_cow"

module CowSay
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
