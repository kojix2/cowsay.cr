require "../abstract_cow"

module Cowsay
  class Udder < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}    (__)               
        #{@eyes}\\               
       ('') \\---------     
        #{@tongue}\\           \\    
           |          |\\   
           ||---(  )_|| *  
           ||    UU  ||    
           ==        ==    

COW
    end
  end
end
