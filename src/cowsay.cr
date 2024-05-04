require "./cowsay/version"
require "./cowsay/abstract_cow"
require "./cowsay/cows/*"

module Cowsay
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

  def self.[](character) : Class
    case character.to_s
    when "beavis.zen"        then BeavisZen
    when "bong"              then Bong
    when "bud-frogs"         then BudFrogs
    when "bunny"             then Bunny
    when "capybara"          then Capybara
    when "cheese"            then Cheese
    when "cow"               then Cow
    when "cower"             then Cower
    when "daemon"            then Daemon
    when "dragon"            then Dragon
    when "dragon-and-cow"    then DragonAndCow
    when "elephant"          then Elephant
    when "elephant-in-snake" then ElephantInSnake
    when "eyes"              then Eyes
    when "flaming-sheep"     then FlamingSheep
    when "ghostbusters"      then Ghostbusters
    when "head-in"           then HeadIn
    when "hellokitty"        then Hellokitty
    when "kiss"              then Kiss
    when "kitty"             then Kitty
    when "koala"             then Koala
    when "kosh"              then Kosh
    when "luke-koala"        then LukeKoala
    when "mech-and-cow"      then MechAndCow
    when "meow"              then Meow
    when "milk"              then Milk
    when "moofasa"           then Moofasa
    when "moose"             then Moose
    when "mutilated"         then Mutilated
    when "owl"               then Owl
    when "ren"               then Ren
    when "satanic"           then Satanic
    when "sheep"             then Sheep
    when "skeleton"          then Skeleton
    when "small"             then Small
    when "sodomized"         then Sodomized
    when "stegosaurus"       then Stegosaurus
    when "stimpy"            then Stimpy
    when "supermilker"       then Supermilker
    when "surgery"           then Surgery
    when "telebears"         then Telebears
    when "three-eyes"        then ThreeEyes
    when "turkey"            then Turkey
    when "turtle"            then Turtle
    when "tux"               then Tux
    when "udder"             then Udder
    when "vader"             then Vader
    when "vader-koala"       then VaderKoala
    when "www"               then Www
    else
      raise "Unknown cow type: #{character}"
    end
  end
end
