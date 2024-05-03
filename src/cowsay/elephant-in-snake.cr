require "./abstract_cow"

module CowSay
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
