# playerctl-butler
### May I take care of the volume for you, Sir?

#### The issue
Inevitably, every album ends up being mixed at different volumes, and when listening to several in a row you find yourself having to find the perfect volume again and again, every time you go through it. Normalization isn't a feature every client offers, and when it's there it often is unrealiable, leading to unsatisfying results.

#### Come in, Jeeves
`playerctl-butler` is a bash script that keeps track of the desired volume for each album - or whatever combination of metadata - and applies it to the player of choice when they match. It depends on `playerctl` to interface with [MPRIS](https://specifications.freedesktop.org/mpris-spec/latest/) without reinventing the wheel.

#### Customization
The properties and player to be checked can be customized, as well as how often. The script itself comes with a self-explanatory example, and more details on the format are given [by `playerctl` itself](https://github.com/altdesktop/playerctl#printing-properties-and-metadata).

#### Usage
Once the case-insensitive metadata `map`, `format`, `player` and `interval` variables have been set in the script, the script needs no further args. `nohup ./playerctl-butler.sh &` will do just fine.

#### TODO
- [ ] Support for partial player name match
- [ ] Loop through every player if no player information is configured
