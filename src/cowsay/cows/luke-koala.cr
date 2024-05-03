require "../abstract_cow"

module Cowsay
  class LukeKoala < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}          .
       ___   //
     {~._.~}// 
      ( Y )K/  
     ()~*~()   
     (_)-(_)   
     Luke    
     Sywalker
     koala   

COW
    end
  end
end
