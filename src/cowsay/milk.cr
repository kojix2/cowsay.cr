require "./abstract_cow"

module CowSay
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
