require "../src/cowsay"

# This is a simple example of how to use the Cowsay module
# as a library in your own code.

# The Cowsay module provides a class method called say
puts Cowsay.say("Hello, I am a cow")
puts Cowsay.think(
  "Hello, I am a cow",
  character: "cow",
  mode: "borg",
)

# You can also create a new cow object and call the say method on it
cow = Cowsay::Cow.new
puts cow.say("Hello, I am a cow")