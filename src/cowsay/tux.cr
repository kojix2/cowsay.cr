require "./abstract_cow"

module CowSay
  class Tux < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}
    #{@thoughts}
        .--.
       |o_o |
       |:_/ |
      //   \\ \\
     (|     | )
    /'\\_   _/`\\
    \\___)=(___/


COW
    end
  end
end
