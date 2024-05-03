require "../abstract_cow"

module Cowsay
  class Supermilker < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}   ^__^
   #{@thoughts}  (#{@eyes})\\_______        ________
      (__)\\       )\\/\\    |Super |
       #{@tongue} ||----W |       |Milker|
          ||    UDDDDDDDDD|______|

COW
    end
  end
end
