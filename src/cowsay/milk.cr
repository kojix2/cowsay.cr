require "./abstract_cow"

module Cowsay
  class Milk < AbstractCow
    def render_cow
      <<-COW
 #{@thoughts}     ____________ 
  #{@thoughts}    |__________|
      /           /\\
     /           /  \\
    /___________/___/|
    |          |     |
    |  ==\\ /== |     |
    |   O   O  | \\ \\ |
    |     <    |  \\ \\|
   /|          |   \\ \\
  / |  \\_____/ |   / /
 / /|          |  / /|
/||\\|          | /||\\/
    -------------|   
        | |    | | 
       <__/    \\__>

COW
    end
  end
end
