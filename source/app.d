import std.stdio;

import std.algorithm;
import std.array;
import std.range;
import std.conv;
import std.file;
import std.path;
import std.string;

////
import std.random;
import core.thread;
import core.time;

class RazerDeviceProvider {
  RazerDevice[] devices() {
    return dirEntries("/sys/bus/hid/drivers/razerkbd/", SpanMode.shallow)
      .filter!(a => buildPath(a, "device_type").exists)
      .map!(a => new RazerDevice(a))
      .array;
  }
}


struct Dimension {
  int width;
  int height;
}

struct Color {
  ubyte red;
  ubyte green;
  ubyte blue;

  ubyte[] toArray() {
    return [red, green, blue];
  }
}

class RazerDevice {
  private {
    immutable string basePath;
  }

  this(const string basePath) {
    this.basePath = basePath;
  }

  string country() {
    return readText(buildPath(basePath, "country")).strip;
  }

  string type() {
    return readText(buildPath(basePath, "device_type")).strip;
  }

  string serial() {
    return readText(buildPath(basePath, "device_serial")).strip;
  }

  string mode() {
    return readText(buildPath(basePath, "device_mode")).strip;
  }

  string firmwareVersion() {
    return readText(buildPath(basePath, "firmware_version")).strip;
  }

  bool logoLedState() {
    return readText(buildPath(basePath, "logo_led_state")).strip == "1";
  }


  string driverVersion() {
    return readText(buildPath(basePath, "version")).strip;
  }


  void setKeyRow(ubyte row, Color[] colors) {
    ubyte[] colorList = colors.map!"a.toArray".join;
    ubyte[] list = [ row, 0, colors.length - 1 ].to!(ubyte[]).chain(colorList).array;

    std.file.write(buildPath(basePath, "matrix_custom_frame"), list);
  }

  void flush() {
    std.file.write(buildPath(basePath, "matrix_effect_custom"), "1");
  }
}


void main() {
  auto provider = new RazerDeviceProvider;
  auto device = provider.devices[0];

  writeln("type: ", device.type);
  writeln("country: ", device.country);
  writeln("serial: ", device.serial);
  writeln("firmwareVersion: ", device.firmwareVersion);
  writeln("driverVersion: ", device.driverVersion);
  writeln("logoLedState: ", device.logoLedState);

  Color[] colors;
  auto gen = Random(unpredictableSeed);
  
  while(true) {
    foreach(row; 0..6){
      colors = [];
      foreach(i; 0..16) {
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
