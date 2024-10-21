require "uniwidth"

module Cowsay
  class AbstractCow
    property eyes : String
    property tongue : String
    property mode : String
    property wrapcolumn : Int32

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

    def initialize(@mode = "default", eyes = nil, tongue = nil, wrapcolumn = 40)
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

    private def construct_balloon(message, balloon_type)
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

      formatted_messages = format_message(message)
      String.build do |s|
        if formatted_messages.size == 1
          msg = formatted_messages.first
          max_line_width = UnicodeCharWidth.width(msg)
          s << " #{"_" * (max_line_width + 2)} \n"
          s << "#{border.first} #{msg} #{border.last}\n"
          s << " #{"-" * (max_line_width + 2)} "
        else
          max_line_width = formatted_messages.max_of { |line| UnicodeCharWidth.width(line) }
          s << " #{"_" * (max_line_width + 2)} \n"
          formatted_messages.each_with_index do |line, index|
            case index
            when 0
              left = border[0]
              right = border[1]
            when 1..(formatted_messages.size - 2)
              left = border[2]
              right = border[3]
            when (formatted_messages.size - 1)
              left = border[4]
              right = border[5]
            else
              raise "Invalid index"
            end
            s << "#{left} #{line}#{" " * (max_line_width - UnicodeCharWidth.width(line))} #{right}\n"
          end
          s << " #{"-" * (max_line_width + 2)} "
        end
      end
    end

    private def format_message(message)
      message_lines = [] of String
      if UnicodeCharWidth.width(message) > wrapcolumn
        words = message.split
        line = IO::Memory.new
        words.each do |word|
          if line.size > 0 && (UnicodeCharWidth.width(line.to_s) + UnicodeCharWidth.width(word)) > wrapcolumn
            message_lines << line.to_s
            line.clear
          end
          if UnicodeCharWidth.width(word) > wrapcolumn
            strings = UnicodeCharWidth.wrap(word, wrapcolumn).lines.compact
            line << strings.pop
            message_lines = message_lines.concat(strings)
          elsif line.size == 0
            line << word
          else
            line << " " << word
          end
        end
        message_lines << line.to_s
      else
        message_lines << message
      end

      message_lines
    end

    def render_cow
      raise NotImplementedError.new("You must implement render_cow in your cow class")
    end
  end
end
