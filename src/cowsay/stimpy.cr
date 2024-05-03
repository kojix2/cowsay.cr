require "./abstract_cow"

module Cowsay
  class Stimpy < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}     .    _  .    
   #{@thoughts}    |\\_|/__/|    
       / / \\/ \\  \\  
      /__|O||O|__ \\ 
     |/_ \\_/\\_/ _\\ |  
     | | (____) | ||  
     \\/\\___/\\__/  // 
     (_/         ||
      |          ||
      |          ||\\   
       \\        //_/  
        \\______//
       __ || __||
      (____(____)

COW
    end
  end
end
