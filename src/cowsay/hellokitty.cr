require "./abstract_cow"

module CowSay
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
