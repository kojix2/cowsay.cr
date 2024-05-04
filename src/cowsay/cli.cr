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

OptionParser.parse do |parser|
  parser.banner = "Usage: cowsay [options] message"

  parser.on("-c", "--cow CHARACTER", "Selects a character") { |c| character = c }

  # Think option
  parser.on("-n", "--think", "Makes the cow think") { action = Action::Think }

  # Eye option
  parser.on("-e EYES", "--eyes=EYES", "Sets the eyes of the cow (default 'oo')") { |e| eyes = e }

  # Tongue option
  parser.on("-T TONGUE", "--tongue=TONGUE", "Sets the tongue of the cow (default '  ')") { |t| tongue = t }

  # Mode options
  parser.on("-b", "--borg", "Borg mode") { mode = "borg" }
  parser.on("-d", "--dead", "appear dead") { mode = "dead" }
  parser.on("-g", "--greedy", "Greedy mode") { mode = "greedy" }
  parser.on("-p", "--paranoid", "Paranoid mode") { mode = "paranoid" }
  parser.on("-s", "--stoned", "Stoned mode") { mode = "stoned" }
  parser.on("-t", "--tired", "Tired mode") { mode = "tired" }
  parser.on("-w", "--wired", "Wired mode") { mode = "wired" }
  parser.on("-y", "--young", "Youthful appearance") { mode = "young" }

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

case action
when Action::Say
  puts Cowsay.say(
    ARGV.join(" "),
    character: character,
    mode: mode, eyes: eyes, tongue: tongue
  )
when Action::Think
  puts Cowsay.think(
    ARGV.join(" "),
    character: character,
    mode: mode, eyes: eyes, tongue: tongue
  )
end
