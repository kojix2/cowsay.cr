require "../abstract_cow"

module Cowsay
  class Bong < AbstractCow
    def render_cow
      <<-COW
         #{@thoughts}
          #{@thoughts}
            ^__^
    _______/(#{@eyes})
/\\/(       /(__)
   | W----|| |~|
   ||     || |~|  ~~
             |~|  ~
             |_| o
             |#|/
            _+#+_

COW
    end
  end
end
