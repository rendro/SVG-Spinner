###
Spinning loader svg generator script
by Robert Fleischmann
###

params = process.argv.slice(2).map (arg) -> parseFloat arg
options =
  dots: parseInt(params[0] or 12, 10)
  dotSize: params[1] or 2
  radius: params[2] or 10
  duration: params[3] or 1.2
  minOpacity: params[4] or 0
  maxOpacity: params[5] or 1
  eccentricity: Math.max(Math.min(params[6] or 0, 0.9999), -0.9999)
  color: process.argv[9] or 'black'

addDot = (i) ->
  xPos = (options.radius * (1 + Math.cos(2 * Math.PI * i / options.dots - Math.PI / 2)) + options.dotSize)
  xPos = Math.round(xPos * 10000) / 10000
  yPos = (options.radius * (1 + Math.sin(2 * Math.PI * i / options.dots - Math.PI / 2)) + options.dotSize)
  yPos = Math.round(yPos * 10000) / 10000
  s = options.dotSize
  e = options.eccentricity
  if e > 0
    rx = Math.sqrt((1 - e*e)*s*s)
    ry = s
  else
    rx = s
    ry = Math.sqrt((1 - e*e)*s*s)
  angle = 360 * i / options.dots

  if options.duration > 0
    return """
    <ellipse fill="#{options.color}" transform='rotate(#{angle}, #{xPos}, #{yPos})' cx='#{xPos}' cy='#{yPos}' rx='#{rx}' ry='#{ry}' style='opacity:#{options.minOpacity};'>
      <animate attributeType='CSS' attributeName='opacity' from='#{options.maxOpacity}' to='#{options.minOpacity}' dur='#{options.duration}s' repeatCount='indefinite' begin='#{Math.round(options.duration*i*10000/options.dots)/10000}s' \/>
    </ellipse>\n"""
  else
    return """<ellipse fill="#{options.color}" transform='rotate(#{angle}, #{xPos}, #{yPos})' cx='#{xPos}' cy='#{yPos}' rx='#{rx}' ry='#{ry}' />\n"""

out = """<?xml version='1.0' standalone='no'?>
<!DOCTYPE svg PUBLIC '-//W3C//DTD SVG 1.1//EN' 'http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd'>
<!-- Generated with svg-spin generator script from Robert Fleischmann (http://github.com/rendro/SVG-Spinner) -->
<svg xmlns='http://www.w3.org/2000/svg' version='1.1' width='#{(options.dotSize+options.radius)*2}px' height='#{(options.dotSize+options.radius)*2}px'>
  <g>\n"""

out += addDot i for i in [0...options.dots]

out += """  </g>
</svg>"""

console.log out
