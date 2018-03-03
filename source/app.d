import std.stdio;

import razer.chroma;

////
import std.random;
import core.thread;
import core.time;
import std.conv;
import std.range;
import std.algorithm;
import std.math;


void main() {
  auto device = chromaDevices[0];

  writeln("type: ", device.type);
  writeln("country: ", device.country);
  writeln("serial: ", device.serial);
  writeln("firmwareVersion: ", device.firmwareVersion);
  writeln("driverVersion: ", device.driverVersion);
  writeln("logoLedState: ", device.logoLedState);

  auto gen = Random(unpredictableSeed);

  double total = device.height * device.width;
  
  auto success = Color(0, 200, 0);
  auto blank = Color(0, 0, 200);

  double percentage = 0.9;


  while(percentage < 1) {
    percentage += 0.001;

     auto colors = iota(0, percentage * total)
      .map!(a => success)
      .array;

    auto currentIndex = colors.length / total;
    auto nextIndex = (colors.length + 1) / total;
    auto stepSize = nextIndex - currentIndex;
    auto stepPercentage = 1 - (currentIndex - percentage) / stepSize;

    if(colors.length != total) {
      colors ~= transition(stepPercentage, blank, success);
      colors ~= iota(colors.length, total).map!(a => blank).array;
    }

    if(colors.length < total - 1) {
      colors ~= iota(colors.length, total).map!(a => blank).array;
    }

    auto rows = colors.evenChunks(device.height)
        .enumerate
        .map!(a => a.index % 2 ? a.value.array.reverse.array : a.value.array)
        .enumerate
        .array;

    foreach(row; rows) {
      device.setKeyRow(row.index.to!ubyte, row.value);
    }

    device.flush;

    Thread.sleep(100.msecs);
  }
}
