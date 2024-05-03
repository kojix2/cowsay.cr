require "./abstract_cow"

module CowSay
  class Elephant < AbstractCow
    def render_cow
      <<-COW
 #{@thoughts}     /\\  ___  /\\
  #{@thoughts}   // \\/   \\/ \\\\
     ((    O O    ))
      \\\\ /     \\ //
       \\/  | |  \\/ 
        |  | |  |  
        |  | |  |  
        |   o   |  
        | |   | |  
        |m|   |m|  

COW
    end
  end
end
