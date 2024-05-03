require "./abstract_cow"

module Cowsay
  class Owl < AbstractCow
    def render_cow
      <<-COW
    #{@thoughts}   ,   .   ,
     #{@thoughts}  )-_"""_-(
       ./ o\\ /o \\.
      . \\__/ \\__/ .
      ...   V   ...
      ... - - - ...
       .   - -   .
        `-.....-´
COW
    end
  end
end
