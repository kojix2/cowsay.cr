require "./cowsay/version"
require "./cowsay/abstract_cow"
require "./cowsay/cows/*"

module Cowsay
  class UnknownCharacterError < ArgumentError; end

  # Creates a speech bubble with the given message and renders it with the specified character.
  #
  # ## Parameters
  # * message : The message to display in the speech bubble
  # * character : The character to use (default: "cow")
  # * mode : The face mode to use (default: "default")
  # * eyes : Custom eyes to use (overrides mode)
  # * tongue : Custom tongue to use (overrides mode)
  # * wrapcolumn : Column width for text wrapping (default: 40)
  # * color : Whether to enable colored output (default: false)
  #
  # ## Example
  # ```
  # puts Cowsay.say("Hello, World!")
  # puts Cowsay.say("Hello, Tux!", character: "tux", mode: "borg")
  # puts Cowsay.say("Colorful!", color: true)
  # ```
  def self.say(message, character = "cow", mode = "default", eyes = nil, tongue = nil, wrapcolumn = 40, color = false)
    self[character]
      .new(mode: mode, eyes: eyes, tongue: tongue, wrapcolumn: wrapcolumn, color: color)
      .say(message)
  end

  # Creates a thought bubble with the given message and renders it with the specified character.
  #
  # ## Parameters
  # * message : The message to display in the thought bubble
  # * character : The character to use (default: "cow")
  # * mode : The face mode to use (default: "default")
  # * eyes : Custom eyes to use (overrides mode)
  # * tongue : Custom tongue to use (overrides mode)
  # * wrapcolumn : Column width for text wrapping (default: 40)
  # * color : Whether to enable colored output (default: false)
  #
  # ## Example
  # ```
  # puts Cowsay.think("I wonder...")
  # puts Cowsay.think("Hmm...", character: "tux", mode: "paranoid")
  # puts Cowsay.think("Colorful thoughts!", color: true)
  # ```
  def self.think(message, character = "cow", mode = "default", eyes = nil, tongue = nil, wrapcolumn = 40, color = false)
    self[character]
      .new(mode: mode, eyes: eyes, tongue: tongue, wrapcolumn: wrapcolumn, color: color)
      .think(message)
  end

  private CHARACTER_TABLE = {
    "beavis.zen"        => BeavisZen,
    "bong"              => Bong,
    "bud-frogs"         => BudFrogs,
    "bunny"             => Bunny,
    "capybara"          => Capybara,
    "cheese"            => Cheese,
    "cow"               => Cow,
    "cower"             => Cower,
    "daemon"            => Daemon,
    "dragon"            => Dragon,
    "dragon-and-cow"    => DragonAndCow,
    "elephant"          => Elephant,
    "elephant-in-snake" => ElephantInSnake,
    "eyes"              => Eyes,
    "flaming-sheep"     => FlamingSheep,
    "ghostbusters"      => Ghostbusters,
    "head-in"           => HeadIn,
    "hellokitty"        => Hellokitty,
    "kiss"              => Kiss,
    "kitty"             => Kitty,
    "koala"             => Koala,
    "kosh"              => Kosh,
    "luke-koala"        => LukeKoala,
    "mech-and-cow"      => MechAndCow,
    "meow"              => Meow,
    "milk"              => Milk,
    "moofasa"           => Moofasa,
    "moose"             => Moose,
    "mutilated"         => Mutilated,
    "owl"               => Owl,
    "ren"               => Ren,
    "satanic"           => Satanic,
    "sheep"             => Sheep,
    "skeleton"          => Skeleton,
    "small"             => Small,
    "sodomized"         => Sodomized,
    "stegosaurus"       => Stegosaurus,
    "stimpy"            => Stimpy,
    "supermilker"       => Supermilker,
    "surgery"           => Surgery,
    "tanuki"            => Tanuki,
    "telebears"         => Telebears,
    "three-eyes"        => ThreeEyes,
    "turkey"            => Turkey,
    "turtle"            => Turtle,
    "tux"               => Tux,
    "udder"             => Udder,
    "vader"             => Vader,
    "vader-koala"       => VaderKoala,
    "www"               => Www,
  }

  def self.[](character) : Class
    c = character.to_s.downcase
    if c == "random"
      CHARACTER_TABLE.values.sample
    else
      CHARACTER_TABLE.fetch(c) do
        raise UnknownCharacterError.new "Unknown character: #{character}"
      end
    end
  end

  def self.character_names
    CHARACTER_TABLE.keys
  end
end
