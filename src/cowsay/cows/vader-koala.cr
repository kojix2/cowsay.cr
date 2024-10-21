require "../abstract_cow"

module Cowsay
  class VaderKoala < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}
    #{@thoughts}        .
     .---.  //
    Y|o o|Y//
   /_(i=i)K/
   ~()~*~()~
    (_)-(_)

     Darth
     Vader
     koala

COW
    end
  end
end
