# docker-nerd-font-patcher
Run [nerd font patcher][1] via container

# Usage
1. Create an output folder called `output`.
2. Create and run the one time use container and get your new font from the `output` directory.

You may pass in `font-patcher` arguments at the end of the docker command.

### Bash
Single Font:

`docker run --rm -v $(pwd)/your-font.ttf:/input -v $(pwd)/output:/output --user $(id -u) rfvgyhn/nerd-font-patcher --complete --mono --adjust-line-height --careful -ext ttf`

Batch Fonts:
```
for f in "$FONTS_DIR"/*.ttf; do
    [ -e "$f" ] || continue
    docker run --rm -v "$f":/input -v $(pwd)/output:/output --user $(id -u) rfvgyhn/nerd-font-patcher --complete --mono --adjust-line-height --careful -ext "${f##*.}"
done
```

### Powershell
`docker run --rm -v "$($pwd.Path -replace '^|\\+','/' -replace ':')/your-font.ttf:/input" -v "$($pwd.Path -replace '^|\\+','/' -replace ':')/output:/output"  rfvgyhn/nerd-font-patcher --complete --mono --adjust-line-height --careful -ext ttf`

## Volumes
* `/input` The font to be patched
* `/output` Resulting font directory


[1]: https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font
