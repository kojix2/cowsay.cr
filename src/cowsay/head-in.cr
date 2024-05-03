require "./abstract_cow"

module Cowsay
  class HeadIn < AbstractCow
    def render_cow
      <<-COW
    #{@thoughts}
     #{@thoughts}
    ^__^         /
    (#{@eyes})\\_______/  _________
    (__)\\       )=(  ____|_ \\_____
   #{@tongue}   ||----w |  \\ \\     \\_____ |
        ||     ||   ||           ||

COW
    end
  end
end
