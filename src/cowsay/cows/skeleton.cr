require "../abstract_cow"

module Cowsay
  class Skeleton < AbstractCow
    def render_cow
      <<-COW
          #{@thoughts}      (__)      
           #{@thoughts}     /#{@eyes}|  
            #{@thoughts}   (_"_)*+++++++++*
                   //I#\\\\\\\\\\\\\\\\I\\
                   I[I|I|||||I I `
                   I`I'///'' I I
                   I I       I I
                   ~ ~       ~ ~
                     Scowleton

COW
    end
  end
end
