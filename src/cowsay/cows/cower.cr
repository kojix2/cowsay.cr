require "../abstract_cow"

module Cowsay
  class Cower < AbstractCow
    def render_cow
      <<-COW
     #{@thoughts}
      #{@thoughts}
        ,__, |    | 
        (oo)\\|    |___
        (__)\\|    |   )\\_
             |    |_w |  \\
             |    |  ||   *

             Cower....

COW
    end
  end
end
