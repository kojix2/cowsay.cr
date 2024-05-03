require "./abstract_cow"

module CowSay
  class Cow < AbstractCow
    def render_cow
      <<-COW
      #{@thoughts}   ^__^
       #{@thoughts}  (#{@eyes})\\_______
          (__)\\       )\\/\\
           #{@tongue} ||----w |
              ||     ||
COW
    end
  end
end
