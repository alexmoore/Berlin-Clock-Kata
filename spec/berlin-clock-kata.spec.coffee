
describe "BerlinClock Top Light", ->
    it 'parses our numbers correctly', -> 
        @clock = new BerlinClock("00:01:02") 
        expect(@clock.hours).toEqual(0)
        expect(@clock.minutes).toEqual(1)
        expect(@clock.seconds).toEqual(2)

    it 'gives us a yellow top light when the seconds are even', ->
        @clock = new BerlinClock("00:00:00")
        expect(@clock.topLight()).toEqual("Y")

    it 'give us a off top light when the seconds are odd', -> 
        @clock = new BerlinClock("00:00:01")
        expect(@clock.topLight()).toEqual("O")

    it 'give us a off top light when the seconds are odd', -> 
        @clock = new BerlinClock("00:00:01")
        expect(@clock.topLight()).toEqual("O")

describe "BerlinClock 5-Hour Lights", ->
    it 'gives us no 5-hour lights for hours less than 5', ->
        @clock = new BerlinClock("00:00:00")
        expect(@clock.fiveHourLights()).toEqual(["O","O","O","O"])

    it 'gives us 1 red 5-hour light for hours between 5 and 10', ->
        @clock = new BerlinClock("05:00:00")
        expect(@clock.fiveHourLights()).toEqual(["R","O","O","O"])

    it 'gives us 2 red 5-hour lights for hours between 10 and 15', ->
        @clock = new BerlinClock("10:00:00")
        expect(@clock.fiveHourLights()).toEqual(["R","R","O","O"])

    it 'gives us 3 red 5-hour lights for hours between 15 and 20', ->
        @clock = new BerlinClock("15:00:00")
        expect(@clock.fiveHourLights()).toEqual(["R","R","R","O"])

    it 'gives us 4 red 5-hour lights for hours 20 and over', ->
        @clock = new BerlinClock("20:00:00")
        expect(@clock.fiveHourLights()).toEqual(["R","R","R","R"])

describe "BerlinClock 1-Hour Lights", -> 
    it 'gives us no 1-hour lights for hours evenly divisible by 5', ->
        @clock = new BerlinClock("00:00:00")
        expect(@clock.hourLights()).toEqual(["O","O","O","O"])
    it 'gives us 1 1-hour lights for hours mod 5 remainder 1', ->
        @clock = new BerlinClock("01:00:00")
        expect(@clock.hourLights()).toEqual(["R","O","O","O"])
    it 'gives us 2 1-hour lights for hours mod 5 remainder 2', ->
        @clock = new BerlinClock("02:00:00")
        expect(@clock.hourLights()).toEqual(["R","R","O","O"])
    it 'gives us 3 1-hour lights for hours mod 5 remainder 3', ->
        @clock = new BerlinClock("03:00:00")
        expect(@clock.hourLights()).toEqual(["R","R","R","O"])
    it 'gives us 4 1-hour lights for hours mod 5 remainder 4', ->
        @clock = new BerlinClock("04:00:00")
        expect(@clock.hourLights()).toEqual(["R","R","R","R"])

describe "BerlinClock 5-Minute Lights", ->
    it 'gives us no 5-minute lights for minutes less than 5', ->
        @clock = new BerlinClock("00:00:00")
        expect(@clock.fiveMinuteLights()).toEqual(["O","O","O","O","O","O","O","O","O","O","O"])
    it 'gives us 1 yellow 5-minute lights for minutes between 5 and 10', ->
        @clock = new BerlinClock("00:06:00")
        expect(@clock.fiveMinuteLights()).toEqual(["Y","O","O","O","O","O","O","O","O","O","O"])
    it 'gives us 2 yellow 5-minute lights for minutes between 10 and 15', ->
        @clock = new BerlinClock("00:11:00")
        expect(@clock.fiveMinuteLights()).toEqual(["Y","Y","O","O","O","O","O","O","O","O","O"])
    it 'gives us 2 yellow and 1 red 5-minute lights for minutes between 15 and 20', ->
        @clock = new BerlinClock("00:16:00")
        expect(@clock.fiveMinuteLights()).toEqual(["Y","Y","R","O","O","O","O","O","O","O","O"])
    it 'gives us YYRYYRYYRYY 5-minute lights for minutes past 55', ->
        @clock = new BerlinClock("00:59:00")
        expect(@clock.fiveMinuteLights()).toEqual(["Y","Y","R","Y","Y","R","Y","Y","R","Y","Y"])

describe "BerlinClock 1-Minute Lights", -> 
    it 'gives us no 1-minute lights for minutes evenly divisible by 5', ->
        @clock = new BerlinClock("00:00:00")
        expect(@clock.minuteLights()).toEqual(["O","O","O","O"])
    it 'gives us 1 1-minute lights for minutes mod 5 remainder 1', ->
        @clock = new BerlinClock("01:00:00")
        expect(@clock.minuteLights()).toEqual(["Y","O","O","O"])
    it 'gives us 2 1-minute lights for minutes mod 5 remainder 2', ->
        @clock = new BerlinClock("02:00:00")
        expect(@clock.minuteLights()).toEqual(["Y","Y","O","O"])
    it 'gives us 3 1-minute lights for minutes mod 5 remainder 3', ->
        @clock = new BerlinClock("03:00:00")
        expect(@clock.minuteLights()).toEqual(["Y","Y","Y","O"])
    it 'gives us 4 1-minute lights for minutes mod 5 remainder 4', ->
        @clock = new BerlinClock("04:00:00")
        expect(@clock.minuteLights()).toEqual(["Y","Y","Y","Y"])

