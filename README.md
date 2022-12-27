# HeizungsLuefter

Control a heater fan with a tuya smart plug based on FritzBox DECT thermostate data.

This is a DIY replacement for commercially available heater fans like [SpeedComfort](https://amzn.to/3G4wfZ8).

![Picture of a DIY heater fan](/docs/images/fan.png)

## How it works
The fans create a higher airflow through the heater. The room heats up quicker and you an run your furnace on a lower temperatur. 

I use this for the heater in my homeoffice which is a bit small for the room size.

1. The DECT Thermostat delivers set and current temperatur via the FritzBox Smarthome API.
2. If current is below set the smart plug and hence the fan is turned on.
3. If current is equal or above the set temperatur the room has reached the desired temperatur and the fan is turned off.
4. Check the thermostat values again after 10 minutes.

## Parts needed for heater with 1m:
- DECT Thermostat for your FritzBox (e.g. https://amzn.to/3VsvBtR). I use the cheaper Eurotonics Comnet DECT version!
- Cable duct 10x13mm 2m
- 4x Fan 60x10mm with 5V (e.g. https://amzn.to/3WvFj06). Use more if your heater is wider.
- 5V Power supply. Make sure it doesn't provide more current than the fans can handle! Mine has only 500mA.
- Neodym magnets to attach the fan to the heater (e.g. https://amzn.to/3jrROLn). You can also use tape of course.
- Smart-Plug (e.g. https://amzn.to/3GjrZ9m). You won't need the power measuring feature.
- Soldering iron
- Cable to connect the fans
- Tape of heat shrinkable tubing to isolate the solded spots
- Cutting pliers

## Assembly
1. Clamp the first fan into the cover of the cable duct 10-15cm from the end.
2. Cut triangles into the sides of the cable duct so you can bend it by 90°.
3. Repeat 2. for the next side of the fan.
4. Cut pieces of the cable duct as separators between the fans. 6 pieces if you have 4 fans like me.
5. Assemble the other fans with the distance pieces in between.
6. Connect the fans with the extra cable and attach the power supply.
7. Test that the fans work.
8. Bend the duct cover around the last fan (repeat 2 and 3) and clip it onto the other side of the fans.
9. Cover the cables with the remaining distancing pieces.
10. Attach the magnets with clue or put them into the distance pieces.

## Installation
1. Clone the repository
2. Create a copy of the settings.example.yaml as settings.yaml and change it with your settings.
3. Install the dependencies with `bundle install`
4. Run the program with `bundle exec ruby lueftersteuerung.rb`

## Thanks

Thanks to @klausmeyer for making some changes to the [fritzbox-smarthome](https://github.com/klausmeyer/fritzbox-smarthome) gem to support my use-case.

