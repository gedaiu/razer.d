module razer.chroma;

import std.algorithm;
import std.array;
import std.range;
import std.conv;
import std.file;
import std.path;
import std.string;
import std.exception;

import razer.hardware;

/// A structure representing the size of a chroma device
struct Dimension {
  /// 
  int width;

  ///
  int height;
}

/// A structure representing a chroma color
struct Color {
  ///
  ubyte red;

  ///
  ubyte green;

  ///
  ubyte blue;

  /// Convert the color to a byte array
  ubyte[] toArray() {
    return [red, green, blue];
  }
}

/// Get an itermiedary color based on a value from 0 and 1 interval
Color transition(double percent, Color from, Color to) {
  auto r = from.red + ( (to.red - from.red) * percent );
  auto g = from.green + ( (to.green - from.green) * percent );
  auto b = from.blue + ( (to.blue - from.blue) * percent );

  return Color(r.to!ubyte, g.to!ubyte, b.to!ubyte);
}

/// Return the razer chroma devices that are connected to your computer
RazerChromaDevice[] chromaDevices() {
  return dirEntries("/sys/bus/hid/drivers/razerkbd/", SpanMode.shallow)
    .filter!(a => buildPath(a, "device_type").exists)
    .map!(a => new RazerChromaDevice(a))
    .array;
}

/// Represents a chroma device and it offers methods for customising
/// the led colors
class RazerChromaDevice {
  private {
    immutable string basePath;
  }

  RazerDevice device;

  alias device this;

  this(const string basePath) {
    this.basePath = basePath;
    this.device = getRazerDevice(basePath.baseName);
  }

  ///
  string country() {
    return readText(buildPath(basePath, "country")).strip;
  }

  /// 
  string type() {
    return readText(buildPath(basePath, "device_type")).strip;
  }
  
  ///
  string serial() {
    return readText(buildPath(basePath, "device_serial")).strip;
  }
  
  ///
  string mode() {
    return readText(buildPath(basePath, "device_mode")).strip;
  }
  
  ///
  string firmwareVersion() {
    return readText(buildPath(basePath, "firmware_version")).strip;
  }

  /// check if the razer logo is illuminated
  bool logoLedState() {
    return readText(buildPath(basePath, "logo_led_state")).strip == "1";
  }

  ///
  string driverVersion() {
    return readText(buildPath(basePath, "version")).strip;
  }

  /// set a row of colors
  void setKeyRow(ubyte row, Color[] colors) {
    enforce(device.hasMatrix, "The device does not support custom effects.");
    enforce(device.height >= row, "The row is too large.");
    enforce(device.width >= colors.length, "The color list is too large.");

    ubyte[] colorList = colors.map!"a.toArray".join;
    ubyte[] list = [ row, 0, colors.length - 1 ].to!(ubyte[]).chain(colorList).array;

    std.file.write(buildPath(basePath, "matrix_custom_frame"), list);
  }

  /// apply the custom effect
  void flush() {
    enforce(device.hasMatrix, "The device does not support custom effects.");
    std.file.write(buildPath(basePath, "matrix_effect_custom"), "1");
  }
}
