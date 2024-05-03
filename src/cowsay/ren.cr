require "./abstract_cow"

module CowSay
  class Ren < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}
    #{@thoughts}
    ____  
   /# /_\\_
  |  |/o\\o\\
  |  \\\\_/_/
 / |_   |  
|  ||\\_ ~| 
|  ||| \\/  
|  |||_    
 \\//  |    
  ||  |    
  ||_  \\   
  \\_|  o|  
  /\\___/   
 /  ||||__ 
    (___)_)

COW
    end
  end
end
