require "./spec_helper"

describe Cowsay::AbstractCow do
  # Using the existing Cow class for testing AbstractCow functionality

  describe "initialization" do
    it "sets default values correctly" do
      cow = Cowsay::Cow.new
      cow.mode.should eq("default")
      cow.eyes.should eq("oo")
      cow.tongue.should eq("  ")
      cow.wrapcolumn.should eq(40)
    end

    it "sets custom values correctly" do
      cow = Cowsay::Cow.new(mode: "borg", eyes: "^^", tongue: "~~", wrapcolumn: 30)
      cow.mode.should eq("borg")
      cow.eyes.should eq("^^")
      cow.tongue.should eq("~~")
      cow.wrapcolumn.should eq(30)
    end

    it "uses mode-specific eyes and tongue when not explicitly provided" do
      cow = Cowsay::Cow.new(mode: "dead")
      cow.eyes.should eq("==")
      cow.tongue.should eq("U ")
    end

    it "raises an error for invalid modes" do
      expect_raises(ArgumentError) do
        Cowsay::Cow.new(mode: "invalid_mode")
      end
    end
  end

  describe "say method" do
    it "creates a speech bubble with the message" do
      cow = Cowsay::Cow.new
      result = cow.say("Hello")
      result.should contain("< Hello >")
      result.should contain("^__^")
    end

    it "handles empty messages" do
      cow = Cowsay::Cow.new
      result = cow.say("")
      result.should contain("<  >")
    end

    it "handles messages with special characters" do
      cow = Cowsay::Cow.new
      result = cow.say("Hello, world! @#$%^&*()")
      result.should contain("Hello, world! @#$%^&*()")
    end
  end

  describe "think method" do
    it "creates a thought bubble with the message" do
      cow = Cowsay::Cow.new
      result = cow.think("Hello")
      result.should contain("( Hello )")
      result.should contain("o") # thought bubble indicator
    end
  end

  describe "message wrapping" do
    it "doesn't wrap short messages" do
      cow = Cowsay::Cow.new(wrapcolumn: 40)
      result = cow.say("Short message")
      result.should contain("< Short message >")
    end

    it "wraps long messages" do
      cow = Cowsay::Cow.new(wrapcolumn: 20)
      long_message = "This is a very long message that should be wrapped to multiple lines"
      result = cow.say(long_message)

      # The message should be split into multiple lines
      result.should_not contain("< #{long_message} >")
      result.should contain("This is a very")
      result.should contain("message that should")
    end

    it "handles very long words" do
      cow = Cowsay::Cow.new(wrapcolumn: 10)
      result = cow.say("Supercalifragilisticexpialidocious")

      # The long word should be split
      result.should contain("Supercalif")
      result.should contain("ragilistic")
    end
  end

  describe "color support" do
    it "enables colored output when color is true" do
      cow = Cowsay::Cow.new(color: true)
      result = cow.say("Colorful")

      # When color is enabled, ANSI escape codes should be present
      result.should contain("\e[")
    end

    it "disables colored output when color is false" do
      cow = Cowsay::Cow.new(color: false)
      result = cow.say("Not colorful")

      # When color is disabled, ANSI escape codes should not be present
      result.should_not contain("\e[")
    end
  end
end
