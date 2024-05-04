# Cowsay (In Crystal)
     ___________
    < OMGHI2U!! >
     -----------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||

## Compilation

```
git clone https://github.com/kojix2/cowsay.cr
shards build
bin/cowsay OMGHI2U!!
```
## Usage

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
    -v, --version                    Displays version information
    -h, --help                       Displays this help message
```

## Development / Contributing

Forked from [ruby cowsay](https://github.com/PatrickTulskie/ruby_cowsay)

- Fork this repository
- Report bugs
- Fix bugs and submit pull requests
- Write, clarify, or fix documentation
- Suggest or add new features

## Special Thanks

I'd like to thank Tony Monroe for the original perl CLI implementation. You can find out more about that here:

    http://www.nog.net/~tony/warez/cowsay.shtml
