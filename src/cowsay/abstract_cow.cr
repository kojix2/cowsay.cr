module Cowsay
  class AbstractCow
    property eyes : String
    property tongue : String
    property face_type : String

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
    MAX_LINE_LENGTH = 36

    def initialize(@face_type = "default", eyes = nil, tongue = nil)
      e, t = FACE_TYPES[@face_type]
      @eyes = eyes || e
      @tongue = tongue || t
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
      elsif message.size < MAX_LINE_LENGTH
        @thoughts = "\\"
        border = %w[< >]
      else
        @thoughts = "\\"
        border = %w[/ \\ \\ / | |]
      end

      formatted_message = format_message(message)
      balloon_lines = String.build do |s|
        if formatted_message.size == 1
          longest_line = formatted_message.first.size
          s << " #{"_" * (longest_line + 2)} \n"
          s << "#{border.first} #{formatted_message.first} #{border.last}\n"
          s << " #{"-" * (longest_line + 2)} "
        else
          longest_line = formatted_message.map { |line| line.size }.sort.last
          s << " #{"_" * (longest_line + 2)} \n"
          formatted_message.each_with_index do |line, index|
            case index
            when 0 then left = border[0]
            right = border[1]
            when (formatted_message.size - 1) then left = border[2]
            right = border[3]
            else left = border[4]
            right = border[5]
            end
            s << "#{left} #{line}#{" " * (longest_line - line.size)} #{right}\n"
          end
          s << " #{"-" * (longest_line + 2)} "
        end
      end
    end

    private def format_message(message)
      message_lines = [] of String
      if message.size > MAX_LINE_LENGTH
        words = message.split
        line = IO::Memory.new
        words.each do |word|
          if line.size > 0 && (line.size + word.size) > MAX_LINE_LENGTH
            message_lines << line.to_s
            line.clear
          end
          if word.size > MAX_LINE_LENGTH
            message_lines << line.to_s
            line.clear
            broken_word = split_word(word)
            message_lines = message_lines.concat(broken_word)
          elsif line.size == 0
            line << word
          else
            line << " " << word
          end
        end
      else
        message_lines << message
      end

      message_lines
    end

    private def split_word(word)
      return [word] unless word.size > MAX_LINE_LENGTH

      lines = [] of String
      while (word.size > 0)
        lines << word.delete_at(0..(MAX_LINE_LENGTH - 1))
      end
      lines.compact
    end

    def render_cow
      raise NotImplementedError.new("You must implement render_cow in your cow class")
    end
  end
end
