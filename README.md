# Homebrew Tap

Homebrew formulae for command line tools published by
[imatson9119](https://github.com/imatson9119).

## hctl

Install the Harness CLI:

```sh
brew tap imatson9119/tap
brew trust --formula imatson9119/tap/hctl
brew install hctl
```

On Homebrew versions that do not require tap trust yet, the `brew trust` command
is optional.

You can also use the fully qualified formula name:

```sh
brew tap imatson9119/tap
brew trust --formula imatson9119/tap/hctl
brew install imatson9119/tap/hctl
```

## curl-snap

Turn a curl request into a polished PNG for PR evidence:

```sh
brew tap imatson9119/tap
brew install curl-snap
```

Needs Chrome/Chromium/Edge/Brave installed for rendering (it won't download one).
See [imatson9119/curl-snap](https://github.com/imatson9119/curl-snap) for usage.
