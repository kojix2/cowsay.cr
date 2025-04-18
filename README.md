# Cowsay (In Crystal)

[![build](https://github.com/kojix2/cowsay.cr/actions/workflows/build.yml/badge.svg)](https://github.com/kojix2/cowsay.cr/actions/workflows/build.yml)

     ___________
    < OMGHI2U!! >
     -----------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||

A Crystal implementation of the classic cowsay program, which generates ASCII art of a cow with a message.

## Installation

### From Binary

Download the latest binary from the [Releases](https://github.com/kojix2/cowsay.cr/releases) page.

### From Source

```bash
git clone https://github.com/kojix2/cowsay.cr
cd cowsay.cr
shards build --release
```

The compiled binary will be available at `bin/cowsay`.

## Usage

### As a Command Line Tool

Basic usage:

```bash
bin/cowsay "Hello, World!"
```

Output:
```
 _____________
< Hello, World! >
 -------------
      \   ^__^
       \  (oo)\_______
          (__)\       )\/\
              ||----w |
              ||     ||
```

Using a different character:

```bash
bin/cowsay -c tux "Hello, Linux!"
```

Making the character think:

```bash
bin/cowsay -n "I am thinking..."
```

Using different modes:

```bash
bin/cowsay -b "Borg mode"  # Borg mode
bin/cowsay -d "Dead mode"  # Dead mode
bin/cowsay -s "Stoned mode"  # Stoned mode
```

Custom eyes and tongue:

```bash
bin/cowsay -e ^^ -T ~~ "Custom face"
```

Colored output:

```bash
bin/cowsay -C "Colorful message!"
```

### As a Library

```crystal
require "cowsay"

# Basic usage
puts Cowsay.say("Hello, World!")

# Using a different character
puts Cowsay.say("Hello, Linux!", character: "tux")

# Making the character think
puts Cowsay.think("I am thinking...")

# Using different modes
puts Cowsay.say("Borg mode", mode: "borg")
puts Cowsay.say("Dead mode", mode: "dead")

# Custom eyes and tongue
puts Cowsay.say("Custom face", eyes: "^^", tongue: "~~")

# Colored output
puts Cowsay.say("Colorful message!", color: true)

# Direct class usage
cow = Cowsay::Cow.new(mode: "stoned", color: true)
puts cow.say("I'm feeling strange...")
```

## Command Line Options

```
Usage: cowsay [options] message
    -c, --cow CHARACTER              Selects a character
    -n, --think                      Makes the cow think
    -e EYES, --eyes=EYES             Sets the eyes of the cow (default 'oo')
    -T TONGUE, --tongue=TONGUE       Sets the tongue of the cow (default '  ')
    -b, --borg                       Borg mode
    -d, --dead                       appear dead
    -g, --greedy                     Greedy mode
    -p, --paranoid                   Paranoid mode
    -s, --stoned                     Stoned mode
    -t, --tired                      Tired mode
    -w, --wired                      Wired mode
    -y, --young                      Youthful appearance
    -l, --list                       Lists available characters
    -W, --wrap-column WIDTH          Sets the width of the cow
    -C, --color                      Enable colored output
    -v, --version                    Displays version information
    -h, --help                       Displays this help message
```

## Available Characters

You can list all available characters with:

```bash
bin/cowsay -l
```

Some notable characters include:
- `cow`: The default cow
- `tux`: The Linux mascot
- `dragon`: A dragon
- `sheep`: A sheep
- `turtle`: A turtle
- `bunny`: A bunny
- `moose`: A moose
- And many more!

## Face Modes

The following face modes are available:

| Mode      | Description                | Eyes | Tongue |
|-----------|----------------------------|------|--------|
| default   | Default face               | oo   |        |
| borg      | Borg mode                  | ==   |        |
| dead      | Dead face                  | ==   | U      |
| greedy    | Greedy face                | $$   |        |
| paranoid  | Paranoid face              | @@   |        |
| stoned    | Stoned face                | **   | U      |
| tired     | Tired face                 | --   |        |
| wired     | Wired face                 | OO   |        |
| young     | Young face                 | ..   |        |

## Development / Contributing

This project was forked from [ruby cowsay](https://github.com/PatrickTulskie/ruby_cowsay).

Here are some ways you can contribute:
- Fork this repository
- Report bugs
- Fix bugs and submit pull requests
- Write, clarify, or fix documentation
- Suggest or add new features
- Add tests

## Special Thanks

Special thanks to Tony Monroe for the original perl CLI implementation. You can find out more about that here:

    http://www.nog.net/~tony/warez/cowsay.shtml
