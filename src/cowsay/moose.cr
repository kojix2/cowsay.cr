require "./abstract_cow"

module CowSay
  class Moose < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}   \\_\\_    _/_/
    #{@thoughts}      \\__/
           (#{@eyes})\\_______
           (__)\\       )\\/\\
            #{@tongue} ||----w |
               ||     ||

COW
    end
  end
end
