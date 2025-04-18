require "uniwidth"

module Cowsay
  class AbstractCow
    property eyes : String
    property tongue : String
    property mode : String
    property wrapcolumn : Int32
    property color : Bool = false

    FACE_TYPES = {
      "default"  => ["oo", "  "],
      "borg"     => ["==", "  "],
      "dead"     => ["==", "U "],
      "greedy"   => ["$$", "  "],
      "paranoid" => ["@@", "  "],
      "stoned"   => ["**", "U "],
      "tired"    => ["--", "  "],
      "wired"    => ["OO", "  "],
      "young"    => ["..", "  "],
    }

    def initialize(@mode = "default", eyes = nil, tongue = nil, wrapcolumn = 40, @color = false)
      e, t = FACE_TYPES.fetch(@mode) { raise ArgumentError.new("Invalid mode: #{@mode}") }
      @eyes = eyes || e
      @tongue = tongue || t
      @wrapcolumn = wrapcolumn
    end

    def say(message, balloon_type = "say")
      construct_balloon(message, balloon_type) + "\n" + render_cow
    end

    def think(message)
      construct_balloon(message, "think") + "\n" + render_cow
    end

    # Constructs a speech or thought bubble containing the message.
    # The bubble's shape depends on the balloon_type and message length.
    #
    # Parameters:
    # - message: The message to display in the bubble
    # - balloon_type: Either "say" (speech bubble) or "think" (thought bubble)
    #
    # Returns:
    # - A string representing the constructed bubble with the message inside
    private def construct_balloon(message, balloon_type)
      # Set the thought indicator and border characters based on the balloon type and message length
      if balloon_type == "think"
        @thoughts = "o"
        border = %w[( ) ( ) ( )]
      elsif UnicodeCharWidth.width(message) <= wrapcolumn
        @thoughts = "\\"
        border = %w[< >]
      else
        @thoughts = "\\"
        border = ["/", "\\", "|", "|", "\\", "/"]
      end

      # Format the message into lines that fit within the wrap column
      formatted_messages = format_message(message)

      String.build do |s|
        # Calculate the maximum line width for proper bubble sizing
        max_line_width = formatted_messages.max_of { |line| UnicodeCharWidth.width(line) }

        # Add the top border of the bubble
        top_border = colorize(" #{"_" * (max_line_width + 2)} ", "36")
        s << top_border << "\n"

        if formatted_messages.size == 1
          # Single line message - simple bubble
          msg = formatted_messages.first
          padding = " " * (max_line_width - UnicodeCharWidth.width(msg))
          line = "#{colorize(border.first, "36")} #{msg}#{padding} #{colorize(border.last, "36")}"
          s << line << "\n"
        else
          # Multi-line message - complex bubble
          formatted_messages.each_with_index do |line, index|
            # Determine the left and right border characters based on position
            left, right = case index
                          when 0
                            [border[0], border[1]] # Top line
                          when (formatted_messages.size - 1)
                            [border[4], border[5]] # Bottom line
                          else
                            [border[2], border[3]] # Middle lines
                          end

            # Calculate padding to align the right border
            padding = " " * (max_line_width - UnicodeCharWidth.width(line))

            # Construct the line with colored borders
            bubble_line = "#{colorize(left, "36")} #{line}#{padding} #{colorize(right, "36")}"
            s << bubble_line << "\n"
          end
        end

        # Add the bottom border of the bubble
        bottom_border = colorize(" #{"-" * (max_line_width + 2)} ", "36")
        s << bottom_border
      end
    end

    # Formats a message into lines that fit within the wrap column width.
    # This method handles word wrapping, long word splitting, and preserves
    # the visual width of Unicode characters.
    #
    # Parameters:
    # - message: The message to format
    #
    # Returns:
    # - An array of strings, each representing a line of the formatted message
    private def format_message(message)
      # If the message fits within the wrap column, return it as a single line
      return [message] if UnicodeCharWidth.width(message) <= wrapcolumn

      message_lines = [] of String
      current_line = IO::Memory.new
      words = message.split

      words.each do |word|
        word_width = UnicodeCharWidth.width(word)
        current_line_width = UnicodeCharWidth.width(current_line.to_s)

        # Check if adding this word would exceed the wrap column
        if current_line.size > 0 && (current_line_width + 1 + word_width) > wrapcolumn
          # Save the current line and start a new one
          message_lines << current_line.to_s
          current_line.clear
        end

        # Handle words that are longer than the wrap column
        if word_width > wrapcolumn
          # If we have content in the current line, save it first
          if current_line.size > 0
            message_lines << current_line.to_s
            current_line.clear
          end

          # Split the long word
          word_parts = UnicodeCharWidth.wrap(word, wrapcolumn).lines.compact

          # Add all parts except the last one to message_lines
          if word_parts.size > 1
            message_lines.concat(word_parts[0...-1])
          end

          # Add the last part to the current line
          current_line << word_parts.last if word_parts.size > 0
        else
          # Add a space before the word if the line is not empty
          current_line << " " unless current_line.size == 0
          current_line << word
        end
      end

      # Add the last line if it's not empty
      message_lines << current_line.to_s unless current_line.to_s.empty?

      message_lines
    end

    # Colorizes text if color is enabled
    #
    # Parameters:
    # - text: The text to colorize
    # - color_code: The ANSI color code to use
    #
    # Returns:
    # - The colorized text if color is enabled, otherwise the original text
    private def colorize(text, color_code)
      return text unless @color
      "\e[#{color_code}m#{text}\e[0m"
    end

    def render_cow
      raise NotImplementedError.new("You must implement render_cow in your cow class")
    end
  end
end
