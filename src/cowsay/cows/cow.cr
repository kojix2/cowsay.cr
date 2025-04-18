require "../abstract_cow"

module Cowsay
  class Cow < AbstractCow
    # Renders the cow ASCII art with the configured eyes and tongue.
    # If color is enabled, the eyes and tongue will be colorized.
    #
    # Returns:
    # - A string containing the cow ASCII art
    def render_cow
      <<-COW
      #{@thoughts}   ^__^
       #{@thoughts}  (#{colorize(@eyes, "33")})\\_______
          (__)\\       )\\/\\
           #{colorize(@tongue, "31")} ||----w |
              ||     ||
COW
    end
  end
end
