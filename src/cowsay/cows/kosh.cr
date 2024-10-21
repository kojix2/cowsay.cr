require "../abstract_cow"

module Cowsay
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
