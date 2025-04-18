require "./spec_helper"

describe Cowsay do
  it "has a version number" do
    Cowsay::VERSION.should be_a(String)
  end

  describe ".say" do
    it "returns a string with the message in a speech bubble" do
      result = Cowsay.say("Hello")
      result.should contain("Hello")
      result.should contain("^__^") # cow's eyes
    end

    it "works with different characters" do
      result = Cowsay.say("Hello", character: "tux")
      result.should contain("Hello")
      result.should contain("|o_o |") # tux's eyes
    end

    it "works with different modes" do
      result = Cowsay.say("Hello", mode: "borg")
      result.should contain("Hello")
      result.should contain("==") # borg eyes

      result = Cowsay.say("Hello", mode: "dead")
      result.should contain("Hello")
      result.should contain("==") # dead eyes
      result.should contain("U ") # dead tongue
    end

    it "works with custom eyes and tongue" do
      result = Cowsay.say("Hello", eyes: "^^", tongue: "~~")
      result.should contain("Hello")
      result.should contain("^^") # custom eyes
      result.should contain("~~") # custom tongue
    end

    it "wraps long messages correctly" do
      long_message = "This is a very long message that should be wrapped to multiple lines"
      result = Cowsay.say(long_message, wrapcolumn: 20)

      # The message should be split into multiple lines
      result.should contain("This is a very")
      result.should contain("message that should")
    end
  end

  describe ".think" do
    it "returns a string with the message in a thought bubble" do
      result = Cowsay.think("Hello")
      result.should contain("Hello")
      result.should contain("o") # thought bubble indicator
    end
  end

  describe "character selection" do
    it "raises an error for unknown characters" do
      expect_raises(Cowsay::UnknownCharacterError) do
        Cowsay.say("Hello", character: "nonexistent")
      end
    end

    it "returns a list of available characters" do
      characters = Cowsay.character_names
      characters.should be_a(Array(String))
      characters.size.should be > 0
      characters.should contain("cow")
      characters.should contain("tux")
    end
  end
end
