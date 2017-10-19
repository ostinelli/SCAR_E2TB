![E2TB logo](https://cldup.com/isZPFlSHn0.png)

# E2TB: Export to Terrain Builder

**E2TB** is a small module for Arma 3 that allows you to export data to Terrain Builder in `.lbt` files' format.


## Why
If you have tried to import from EDEN or other custom tools in Terrain Builder, you may have seen the hassle of objects' rotations being often incorrect. This fixes most of those issues. You can check out results in this comparison image:

![E2TB Comparison](https://cldup.com/eOdeb2Gtga.jpg)

You may notice that one of the cubes above is slightly tilted. If we could fix that, that'd be great.

## Download

You can get the module from [Steam](http://steamcommunity.com/sharedfiles/filedetails/?id=1145478729).

## How does it work

  * Copy the objects to the clipboard:
    * From EDEN: click on the menu `Tools > SCAR E2TB: Export to Terrain Builder`
    * From within a mission (SP): run the action `Copy the map objects to the clipboard`
  * Copy the contents of the clipboard in a file and save it with the extension `.lbt`
  * From within your map in Terrain Builder: `File > Import > Objects`

## Thank you

Thanks to all alpha and beta testers, in particular:

  * Lappihuan
  * zgmrvn
  * mikero
  * W4lly63
  * ianbanks
  * Ice
  * cring0
  * Adanteh
  * HorribleGoat
  * T_D I

...and all the other folks involved in the discussions in Discord's Arma3 `#terrain_makers` channel in those memorable days of October 18th and 19th 2017.

## Contribute

So you want to contribute? That's great! Please follow the guidelines below. It will make it easier to get merged in.

Before implementing a new feature, please submit a ticket to discuss what you intend to do. Your feature might already be in the works, or an alternative implementation might have already been discussed.

Do not commit to master in your fork. Provide a clean branch without merge commits. Every pull request should have its own topic branch. In this way, every additional adjustments to the original pull request might be done easily, and squashed with `git rebase -i`. The updated branch will be visible in the same pull request, so there will be no need to open new pull requests when there are changes to be applied.`
