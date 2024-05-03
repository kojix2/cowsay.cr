require "./abstract_cow"

module Cowsay
  class Vader < AbstractCow
    def render_cow
      <<-COW
        #{@thoughts}    ,-^-.
         #{@thoughts}   !oYo!
          #{@thoughts} /./=\\.\\______
               ##        )\\/\\
                ||-----w||
                ||      ||

               Cowth Vader

COW
    end
  end
end
