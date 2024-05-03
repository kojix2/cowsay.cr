require "../src/cowsay"

cow = Cowsay::Cow.new

puts cow.say("Hello, I am a cow")

puts Cowsay.think("Hello, I am tux", type: "tux")
