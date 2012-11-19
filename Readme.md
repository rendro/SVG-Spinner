# SVG Spinner

Modern loading spinner without JavaScript or unnecessary DOM Elements. The spinner and animations are implemented as SVG.

## Why SVG?
SVG Images are extremely small and fully scalable as they are vector based. A simple SVG spinner with 12 dots weights about 750 bytes (gripped ~350 bytes) and looks nice on any resolution. For comparison, the spin.js script weights more than 4 times as much.

## To lazy to write SVG files?
No problem. I added a spin generator script written in CoffeeScript (and a compiled version) executable with Node.js to generate your spinner SVGs.

### Usage
Run in your terminal:

    $ coffee tools/spingenerator.coffee > spinner.svg

or the following, if you don't have CoffeeScript installed:

    $ node tools/spingenerator.js > spinner.svg 
    
### Parameter
Wouldn't it be sad if you could not change a single parameter? Yep, so you can:

    $ coffee tools/spingenerator.coffee <dots> <dotSize> <radius> <duration> <minOpacity> <maxOpacity>
    
* `dots` (int) Number of dots (Default: 12)
* `dotSize` (float) Size of one dot (Default: 2)
* `radius` (float) Radius of the spinner (Default: 10)
* `duration` (float) Speed of the animation in seconds (e.g. `1.4`) (Default: 1.2)
* `minOpacity` (float between 0 and 1) Minimum opacity of a dot (Default: 0)
* `maxOpacity` (float between 0 and 1) Maximum opacity of a dot (Default: 1)

If you only want the dots without any animation, set the duration parameter to a negative value.

### Example

A spinner with 16 Dots at the size of 2, a radius of 20 and a minimum opacity of 0.3:

    $ coffee spingenerator.coffee 16 2 20 0.3 > spin.svg

## Browser Support:

If you don't have to support for every crappy web browser like IE6-8 there is no reason not to use SVG spinning animations. For ancient technology you can always include a fallback png/gif or whatever you want.

**SVG is supporter in the following browsers:**

* IE 9+
* Firefox 4+
* Chrome 4+
* Safari (3.2+ partial, 5+ full)
* Opera 9.5+
* iOS (3.2+ partial, 4.2+ full)
* Opera Mini 5+
* Android Browser 3+
* Blackberry Browser 7+
* Opera Mini 10+
* Chrome for Android 18+
* Firefox for Android 15+

(see: [Can I Use: SVG in CSS backgrounds](http://caniuse.com/#feat=svg-css))