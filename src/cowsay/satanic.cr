require "./abstract_cow"

module CowSay
  class Satanic < AbstractCow
    def render_cow
      <<-COW
     #{@thoughts}
      #{@thoughts}  (__)  
         (\\/)  
  /-------\\/    
 / | 666 ||    
*  ||----||      
   ~~    ~~      

COW
    end
  end
end
