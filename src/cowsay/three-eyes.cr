require "./abstract_cow"

module Cowsay
  class ThreeEyes < AbstractCow
    def render_cow
      <<-COW
        #{@thoughts}  ^___^
         #{@thoughts} (#{@eyes})\\_______
           (___)\\       )\\/\\
            #{@tongue}  ||----w |
                ||     ||

COW
    end
  end
end
