require "./abstract_cow"

module Cowsay
  class Cheese < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}
    #{@thoughts}
      _____   _________
     /     \\_/         |
    |                 ||
    |                 ||
   |    ###\\  /###   | |
   |     0  \\/  0    | |
  /|                 | |
 / |        <        |\\ \\
| /|                 | | |
| |     \\_______/   |  | |
| |                 | / /
/||                 /|||
   ----------------|
        | |    | |
        ***    ***
       /___\\  /___\\

COW
    end
  end
end
