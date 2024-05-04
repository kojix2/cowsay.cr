require "./cowsay/version"
require "./cowsay/abstract_cow"
require "./cowsay/cows/*"

module Cowsay
  class UnknownCharacterError < ArgumentError; end

  def self.say(message, character = "cow", mode = "default", eyes = nil, tongue = nil)
    self[character]
      .new(mode: mode, eyes: eyes, tongue: tongue)
      .say(message)
  end

  def self.think(message, character = "cow", mode = "default", eyes = nil, tongue = nil)
    self[character]
      .new(mode: mode, eyes: eyes, tongue: tongue)
      .think(message)
  end

  private CHARACTER_TABLE= {
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
end
