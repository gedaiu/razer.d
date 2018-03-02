import std.stdio;

import razer.chroma;

////
import std.random;
import core.thread;
import core.time;
import std.conv;


void main() {
  auto device = chromaDevices[0];

  writeln("type: ", device.type);
  writeln("country: ", device.country);
  writeln("serial: ", device.serial);
  writeln("firmwareVersion: ", device.firmwareVersion);
  writeln("driverVersion: ", device.driverVersion);
  writeln("logoLedState: ", device.logoLedState);

  Color[] colors;
  auto gen = Random(unpredictableSeed);
  
  while(true) {
    foreach(row; 0..device.height){
      colors = [];
      foreach(i; 0..device.width) {
        ubyte r = (uniform(0, 5, gen) * 50).to!ubyte;
        ubyte g = (uniform(0, 5, gen) * 50).to!ubyte;
        ubyte b = (uniform(0, 5, gen) * 50).to!ubyte;

        colors ~= Color(r,g,b);
      }

      device.setKeyRow(row.to!ubyte, colors);
    }

    device.flush;

    Thread.sleep(100.msecs);
  }
}
