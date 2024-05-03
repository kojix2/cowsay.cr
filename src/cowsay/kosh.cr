require "./abstract_cow"

module CowSay
  class Kosh < AbstractCow
    def render_cow
      <<-COW
    #{@thoughts}
     #{@thoughts}
      #{@thoughts}
  ___       _____     ___
 /   \\     /    /|   /   \\
|     |   /    / |  |     |
|     |  /____/  |  |     |     
|     |  |    |  |  |     |
|     |  | {} | /   |     |
|     |  |____|/    |     |
|     |    |==|     |     |
|      \\___________/      |
|                         |
|                         |

COW
    end
  end
end
