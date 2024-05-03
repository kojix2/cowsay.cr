require "./abstract_cow"

module Cowsay
  class FlamingSheep < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}            .    .     .   
   #{@thoughts}      .  . .     `  ,     
    #{@thoughts}    .; .  : .' :  :  : . 
     #{@thoughts}   i..`: i` i.i.,i  i . 
      #{@thoughts}   `,--.|i |i|ii|ii|i: 
           U#{@eyes}U\\.'@@@@@@`.||' 
           \\__/(@@@@@@@@@@)'  
                (@@@@@@@@)    
                `YY~~~~YY'    
                 ||    ||     

COW
    end
  end
end
