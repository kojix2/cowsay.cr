require "../abstract_cow"

module Cowsay
  class Sodomized < AbstractCow
    def render_cow
      <<-COW
      #{@thoughts}                _
       #{@thoughts}              (_)
        #{@thoughts}   ^__^       / \\
         #{@thoughts}  (#{@eyes})\\_____/_\\ \\
            (__)\\       ) /
             #{@tongue} ||----w ((
                ||     ||>> 

COW
    end
  end
end
