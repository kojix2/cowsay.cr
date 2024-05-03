require "./abstract_cow"

module Cowsay
  class Mutilated < AbstractCow
    def render_cow
      <<-COW
       #{@thoughts}   \\_______
 v__v   #{@thoughts}  \\   O   )
 (#{@eyes})      ||----w |
 (__)      ||     ||  \\/\\
  #{@tongue}

COW
    end
  end
end
