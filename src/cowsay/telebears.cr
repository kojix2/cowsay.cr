require "./abstract_cow"

module CowSay
  class Telebears < AbstractCow
    def render_cow
      <<-COW
      #{@thoughts}                _
       #{@thoughts}              (_)   <-- TeleBEARS
        #{@thoughts}   ^__^       / \\
         #{@thoughts}  (#{@eyes})\\_____/_\\ \\
            (__)\\  you  ) /
             #{@tongue} ||----w ((
                ||     ||>> 

COW
    end
  end
end
