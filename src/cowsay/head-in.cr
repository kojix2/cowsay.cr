require "./abstract_cow"

module CowSay
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
