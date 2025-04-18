require "../src/cowsay/abstract_cow"

module Cowsay
  class TestCow < AbstractCow
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
