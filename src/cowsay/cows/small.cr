require "../abstract_cow"

module Cowsay
  class Small < AbstractCow
    def render_cow
      <<-COW
       #{@thoughts}   ,__,
        #{@thoughts}  (#{@eyes})____
           (__)    )\\
            #{@tongue}||--|| *

COW
    end
  end
end
