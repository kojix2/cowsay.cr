require "../abstract_cow"

module Cowsay
  class Sheep < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts}
       __
      U#{@eyes}U\\.'@@@@@@`.
      \\__/(@@@@@@@@@@)
           (@@@@@@@@)
           `YY~~~~YY'
            ||    ||

COW
    end
  end
end
