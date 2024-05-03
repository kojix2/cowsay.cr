require "./abstract_cow"

module CowSay
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
