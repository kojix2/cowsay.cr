require "./abstract_cow"

module Cowsay
  class Koala < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}
       ___  
     {~._.~}
      ( Y )
     ()~*~()   
     (_)-(_)   

COW
    end
  end
end
