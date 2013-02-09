Array::clone = ->
    cloned = []
    for i in this
        cloned.push i
    cloned

class BerlinClock
    r = 'R'
    y = 'Y'
    o = 'O'
    minuteLightsPattern = [y, y, r]

    constructor: (time) ->
        [@hours, @minutes, @seconds] = time.split(':').map (t) -> parseInt(t)

    topLight: ->
        if (@seconds % 2 == 0)
            y
        else
            o

    fiveHourLights: ->
        stops = (x for x in [5..20] by 5)
        @yieldLightsGt(@hours, (-> r), stops)

    hourLights: ->
        @yieldLightsMod(@hours, r, 5)

    fiveMinuteLights: ->
        stops = (x for x in [5..55] by 5)
        @yieldLightsGt(@minutes, @minuteLightsStream(), stops)

    minuteLights: ->
        @yieldLightsMod(@hours, y, 5)

    yieldLightsGt: (amount, lightFn, bounds) ->
        bounds.map (b) -> 
            if(amount >= b)
                lightFn()
            else
                o 

    yieldLightsMod: (amount, light, divisor) ->
        foo = []
        numLights = (amount % divisor)

        for i in [1..divisor - 1]
            if(i <= numLights)
                foo.push light
            else
                foo.push o

        foo

    minuteLightsStream: -> 
        lights = minuteLightsPattern.clone()
        ->
            light = lights.shift()
            lights.push light
            light


window.BerlinClock = BerlinClock
