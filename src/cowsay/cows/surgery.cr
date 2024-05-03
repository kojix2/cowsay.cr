require "../abstract_cow"

module Cowsay
  class Surgery < AbstractCow
    def render_cow
      <<-COW
          #{@thoughts}           \\  / 
           #{@thoughts}           \\/  
               (__)    /\\         
               (#{@eyes})   O  O        
               _\\/_   //         
         *    (    ) //       
          \\  (\\\\    //       
           \\(  \\\\    )                              
            (   \\\\   )   /\\                          
  ___[\\______/^^^^^^^\\__/) o-)__                     
 |\\__[=======______//________)__\\                    
 \\|_______________//____________|                    
     |||      || //||     |||
     |||      || @.||     |||                        
      ||      \\/  .\\/      ||                        
                 . .                                 
                '.'.`                                

            COW-OPERATION                           

COW
    end
  end
end
