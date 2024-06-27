require "../cowsay"
require "option_parser"

enum Action : UInt8
  Say
  Think
end

# Define variables to store option values
eyes = nil
tongue = nil
character = "cow"
mode = "default"
action = Action::Say
wrap = 40
debug = false

parser = OptionParser.parse do |parser|
  parser.banner = <<-BANNER

    Program: cowsay (in Crystal)
    Version: #{VERSION}
    Source:  #{SOURCE}

    Usage:   cowsay [options] message
  BANNER

  parser.on("-c", "--cow CHARACTER", "Selects a character") { |c| character = c }

  # Think option
  parser.on("-n", "--think", "Makes the cow think") { action = Action::Think }

  # Eye option
  parser.on("-e", "--eyes EYES", "Sets the eyes of the cow (default 'oo')") { |e| eyes = e }

  # Tongue option
  parser.on("-T", "--tongue TONGUE", "Sets the tongue of the cow (default '  ')") { |t| tongue = t }

  # Mode options
  parser.on("-b", "--borg", "Borg mode") { mode = "borg" }
  parser.on("-d", "--dead", "appear dead") { mode = "dead" }
  parser.on("-g", "--greedy", "Greedy mode") { mode = "greedy" }
  parser.on("-p", "--paranoid", "Paranoid mode") { mode = "paranoid" }
  parser.on("-s", "--stoned", "Stoned mode") { mode = "stoned" }
  parser.on("-t", "--tired", "Tired mode") { mode = "tired" }
  parser.on("-w", "--wired", "Wired mode") { mode = "wired" }
  parser.on("-y", "--young", "Youthful appearance") { mode = "young" }

  parser.on("-l", "--list", "Lists available characters") do
    puts Cowsay.character_names.join(STDOUT.tty? ? ", " : "\n")
    exit
  end

  parser.on("-W", "--wrap-column WIDTH", "Sets the width of the cow") { |w| wrap = w.to_i }

  parser.on("-D", "--debug", "Print error trace") { debug = true }

  # Version option
  parser.on("-v", "--version", "Displays version information") do
    puts Cowsay::VERSION
    exit
  end

  # Help option
  parser.on("-h", "--help", "Displays this help message") do
    puts parser
    exit
  end

  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit(1)
  end
end

message = ARGV.join(" ")
if message.empty?
  STDERR.puts parser
  STDERR.puts Cowsay.say(
    "OMG! You didn't provide a message!",
    character: "random",
    mode: "dead"
  )
  exit(1)
end

begin
  case action
  when Action::Say
    puts Cowsay.say(
      message,
      character: character,
      mode: mode, eyes: eyes, tongue: tongue,
      wrapcolumn: wrap
    )
  when Action::Think
    puts Cowsay.think(
      message,
      character: character,
      mode: mode, eyes: eyes, tongue: tongue,
      wrapcolumn: wrap
    )
  end
rescue Cowsay::UnknownCharacterError
  STDERR.puts STDERR.puts Cowsay.say(
    "Unknown character: #{character}",
    character: "random",
    mode: "wired"
  )
  exit(1)
rescue ex
  STDERR.puts Cowsay.say(
    "ERROR: #{ex.class} #{ex.message}",
    character: "random",
    mode: "paranoid"
  )
  STDERR.puts "\n#{ex.backtrace.join("\n")}" if debug
  exit(1)
end
