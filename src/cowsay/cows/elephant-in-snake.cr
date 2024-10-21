require "../abstract_cow"

module Cowsay
  class ElephantInSnake < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}
    #{@thoughts}              ....
           ........    .
          .            .
         .             .
.........              .......
..............................

Elephant inside ASCII snake

COW
    end
  end
end
