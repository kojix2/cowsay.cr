require "./abstract_cow"

module Cowsay
  class Meow < AbstractCow
    def render_cow
      <<-COW
  #{@thoughts}
   #{@thoughts} ,   _ ___.--'''`--''//-,-_--_.
      \\`"' ` || \\\\ \\ \\\\/ / // / ,-\\\\`,_
     /'`  \\ \\ || Y  | \\|/ / // / - |__ `-,
    /@"\\  ` \\ `\\ |  | ||/ // | \\/  \\  `-._`-,_.,
   /  _.-. `.-\\,___/\\ _/|_/_\\_\\/|_/ |     `-._._)
   `-'``/  /  |  // \\__/\\__  /  \\__/ \\
        `-'  /-\\/  | -|   \\__ \\   |-' |
          __/\\ / _/ \\/ __,-'   ) ,' _|'
         (((__/(((_.' ((___..-'((__,'

COW
    end
  end
end
