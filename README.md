# Homebrew Tap

Homebrew formulae for my projects.

## Install

```bash
brew tap taylorarndt/tap
brew install perspective-cuts
```

## Perspective Cuts

A text-based language for writing Apple Shortcuts. Experimental.

```bash
# Write a shortcut
echo 'import Shortcuts
text(text: "Hello!") -> greeting
showResult(text: greeting)' > hello.perspective

# Compile and sign
perspective-cuts compile --sign hello.perspective

# Import
open hello.shortcut
```

See the full project at [taylorarndt/perspective-cuts](https://github.com/taylorarndt/perspective-cuts).
