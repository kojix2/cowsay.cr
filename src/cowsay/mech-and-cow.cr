require "./abstract_cow"

module CowSay
  class MechAndCow < AbstractCow
    def render_cow
      <<-COW

COW
    end
  end
end
