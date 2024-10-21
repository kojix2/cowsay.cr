require "../abstract_cow"

module Cowsay
  class Stegosaurus < AbstractCow
    def render_cow
      <<-COW
#{@thoughts}                             .       .
 #{@thoughts}                           / `.   .' "
  #{@thoughts}                  .---.  <    > <    >  .---.
   #{@thoughts}                 |    \\  \\ - ~ ~ - /  /    |
         _____          ..-~             ~-..-~
        |     |   \\~~~\\.'                    `./~~~/
       ---------   \\__/                        \\__/
      .'  O    \\     /               /       \\  "
     (_____,    `._.'               |         }  \\/~~~/
      `----.          /       }     |        /    \\__/
            `-.      |       /      |       /      `. ,~~|
                ~-.__|      /_ - ~ ^|      /- _      `..-'
                     |     /        |     /     ~-.     `-. _  _  _
                     |_____|        |_____|         ~ - . _ _ _ _ _>

COW
    end
  end
end
