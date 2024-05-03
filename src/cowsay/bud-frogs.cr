require "./abstract_cow"

module Cowsay
  class BudFrogs < AbstractCow
    def render_cow
      <<-COW
     #{@thoughts}
      #{@thoughts}
          oO)-.                       .-(Oo
         /__  _\\                     /_  __\\
         \\  \\(  |     ()~()         |  )/  /
          \\__|\\ |    (-___-)        | /|__/
          '  '--'    ==`-'==        '--'  '

COW
    end
  end
end
