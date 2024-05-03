require "../abstract_cow"

module Cowsay
  class Daemon < AbstractCow
    def render_cow
      <<-COW
   #{@thoughts}         ,        ,
    #{@thoughts}       /(        )`
     #{@thoughts}      \\ \\___   / |
            /- _  `-/  '
           (/\\/ \\ \\   /\\
           / /   | `    \\
           O O   ) /    |
           `-^--'`<     '
          (_.)  _  )   /
           `.___/`    /
             `-----' /
<----.     __ / __   \\
<----|====O)))==) \\) /====
<----'    `--' `.__,' \\
             |        |
              \\       /
        ______( (_  / \\______
      ,'  ,-----'   |        \\
      `--{__________)        \\/

COW
    end
  end
end
