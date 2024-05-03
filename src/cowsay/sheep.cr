require "./abstract_cow"

module CowSay
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
