# munki-theme
Theming script for Munki's Managed Software Center. Contributions welcome. The script simply clones and builds [Munki](https://github.com/munki/munki) and applies and injects code as needed per the Dark-Theme that we have created. It helps take your Managed Software Center app to the next level offering full CSS injection theming, icons in top bar themeing, and integration with [Munki Rebrand.](https://github.com/ox-it/munki-rebrand) 

## Pre-requisites
 * Apple Mac running OS X/macOS 10.12+ 
 * Xcode 10+ (opened once, components installed)
 * Python 2 (system Python is fine)

## Usage

Please note: munki_theme must be run as root in order to successfully build the output pkg. When the script is fully run successfully the final pkg file will be in the munki-rebrand folder. The non-customized pkg file will be in the munki folder. 

```sudo ./rebrand.sh```
