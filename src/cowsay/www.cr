require "./abstract_cow"

module Cowsay
  class Www < AbstractCow
    def render_cow
      <<-COW
        #{@thoughts}   ^__^
         #{@thoughts}  (#{@eyes})\\_______
            (__)\\       )\\/\\
             #{@tongue} ||--WWW |
                ||     ||

COW
    end
  end
end
