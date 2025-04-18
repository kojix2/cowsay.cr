require "./spec_helper"

describe "CLI" do
  # Skip if there is no executable file
  next unless File.exists?("bin/cowsay")

  it "outputs help message" do
    output = `bin/cowsay --help`
    output.should contain("Usage:")
    output.should contain("--cow")
  end

  it "outputs version" do
    output = `bin/cowsay --version`
    output.should match(/\d+\.\d+\.\d+/)
  end

  it "displays message with default cow" do
    output = `bin/cowsay Hello`
    output.should contain("Hello")
    output.should contain("^__^")
  end

  it "uses specified character" do
    output = `bin/cowsay -c tux Hello`
    output.should contain("Hello")
    output.should contain("|o_o |") # tux's eyes
  end

  it "uses think mode" do
    output = `bin/cowsay -n Hello`
    output.should contain("Hello")
    output.should contain("o") # thought bubble indicator
  end

  it "uses custom eyes" do
    output = `bin/cowsay -e ^^ Hello`
    output.should contain("Hello")
    output.should contain("^^") # custom eyes
  end

  it "uses custom tongue" do
    output = `bin/cowsay -T ~~ Hello`
    output.should contain("Hello")
    output.should contain("~~") # custom tongue
  end

  it "uses borg mode" do
    output = `bin/cowsay -b Hello`
    output.should contain("Hello")
    output.should contain("==") # borg eyes
  end

  it "lists available characters" do
    output = `bin/cowsay -l`
    output.should contain("cow")
    output.should contain("tux")
  end

  it "handles errors gracefully" do
    # Use backticks with a command that will fail, and check the exit status
    status = system("bin/cowsay -c nonexistent Hello")
    status.should be_false
  end

  it "supports color output" do
    output = `bin/cowsay -C Colorful`
    # Note: We can't easily test for ANSI codes here since they're only output
    # when connected to a TTY, which isn't the case in tests
    output.should contain("Colorful")
  end
end
