require "./abstract_cow"

module Cowsay
  class Moofasa < AbstractCow
    def render_cow
      <<-COW
       #{@thoughts}    ____
        #{@thoughts}  /    \\
          | ^__^ |
          | (#{@eyes}) |______
          | (__) |      )\\/\\
           \\____/|----w |
                ||     ||

	         Moofasa

COW
    end
  end
end
