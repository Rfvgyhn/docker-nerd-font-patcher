# docker-nerd-font-patcher
Run [nerd font patcher][1] via container

# Usage
1. Place all fonts you want patched into a folder (e.g. `input`)
2. Create an output folder called `output`.
3. Create and run the one time use container mapping your two folders to the corresponding volumes and get your new fonts from the `output` directory.

You may pass in `font-patcher` arguments at the end of the docker command.

### Bash
`docker run --rm -v $(pwd)/input:/input -v $(pwd)/output:/output --user $(id -u) rfvgyhn/nerd-font-patcher --complete --mono --adjust-line-height --careful`

### Powershell
`docker run --rm -v "$($pwd.Path -replace '^|\\+','/' -replace ':')/input:/input" -v "$($pwd.Path -replace '^|\\+','/' -replace ':')/output:/output"  rfvgyhn/nerd-font-patcher --complete --mono --adjust-line-height --careful`

## Volumes
* `/input` The directory containing the fonts to be patched
* `/output` Resulting font directory


[1]: https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font