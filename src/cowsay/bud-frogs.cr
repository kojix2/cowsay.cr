require "./abstract_cow"

module CowSay
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
