require "./abstract_cow"

module Cowsay
  class BeavisZen < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}         __------~~-,
    #{@thoughts}      ,'            ,
          /               \\
         /                :
        |                  '
        |                  |
        |                  |
         |   _--           |
         _| =-.     .-.   ||
         o|/o/       _.   |
         /  ~          \\ |
       (____@)  ___~    |
          |_===~~~.`    |
       _______.--~     |
       \\________       |
                \\      |
              __/-___-- -__
             /            _ \\

COW
    end
  end
end
