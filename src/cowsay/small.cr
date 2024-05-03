require "./abstract_cow"

module CowSay
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
