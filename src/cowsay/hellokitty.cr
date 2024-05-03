require "./abstract_cow"

module Cowsay
  class Hellokitty < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}
      /\\_)o<
     |      \\
     | O . O|
      \\_____/

COW
    end
  end
end
