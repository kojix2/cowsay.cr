require "./abstract_cow"

module Cowsay
  class Kitty < AbstractCow
    def render_cow
      <<-COW
     #{@thoughts}
      #{@thoughts}
       ("`-'  '-/") .___..--' ' "`-._
         ` *_ *  )    `-.   (      ) .`-.__. `)
         (_Y_.) ' ._   )   `._` ;  `` -. .-'
      _.. `--'_..-_/   /--' _ .' ,4
   ( i l ),-''  ( l i),'  ( ( ! .-'    

COW
    end
  end
end
