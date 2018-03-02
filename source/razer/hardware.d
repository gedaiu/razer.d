module razer.hardware;

import std.format;
import std.string;

///
interface RazerDevice {
  pure {
    ///
    string eventFileRegex();
    
    /// Vendor id
    uint usbVid();

    /// Product id
    uint usbPid();

    /// 
    bool hasMatrix();

    ///
    byte height();

    ///
    byte width();
    
    ///
    string topUrl();

    ///
    string sideImg();

    ///
    string perspectiveImg();
  }
}

mixin template RazerDeviceFields(
    string _eventFileRegex,
    uint _usbPid,
    byte _height,
    byte _width,
    string _topUrl,
    string _sideImg,
    string _perspectiveImg
) {
  pure {
    ///
    string eventFileRegex() {
      return _eventFileRegex;
    }
    
    /// Vendor id
    uint usbVid() {
      return 0x1532;
    }

    /// Product id
    uint usbPid() {
      return _usbPid;
    }

    /// 
    bool hasMatrix() {
      static if(_width == 0 || _height == 0) {
        return false;
      } else {
        return true;
      }
    }

    ///
    byte height() {
      return _height;
    }

    ///
    byte width() {
      return _width;
    }

    ///
    string topUrl() {
      return _topUrl;
    }

    ///
    string sideImg() {
      return _sideImg;
    }

    ///
    string perspectiveImg() {
      return _perspectiveImg;
    }
  }
}

///
class RazerNostromo : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Nostromo-event-kbd",
  0x0111,
  0,0,
  "https://assets.razerzone.com/eeimages/products/59/razer-nostromo-gallery-1.png",
  "https://assets.razerzone.com/eeimages/products/59/razer-nostromo-gallery-1.png",
  "https://assets.razerzone.com/eeimages/products/59/razer-nostromo-gallery-2.png");
}

///
class RazerTartarus : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Tartarus(-if01)?-event-kbd",
  0x0201,
  0,0,
  "https://assets2.razerzone.com/images/tartarus-classic/b0535b8924b38f53cb8b853d536798ed-Tartarus-Classic-Base_gallery04.jpg",
  "https://assets2.razerzone.com/images/tartarus-classic/f89a70c59f993f08e95a8060ee2623da-Tartarus-Classic-Base_gallery02.jpg",
  "https://assets2.razerzone.com/images/tartarus-classic/b3a11ddda103b2473c3253a0a82af389-Tartarus-Classic-Base_gallery03.jpg");
}

///
class RazerTartarusChroma : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Tartarus_Chroma(-if01)?-event-kbd",
  0x0208,
  0,0,
  "https://assets.razerzone.com/eeimages/products/22356/razer-tartarus-chroma-01-02.png",
  "https://assets.razerzone.com/eeimages/products/22356/razer-tartarus-chroma-02.png",
  "https://assets.razerzone.com/eeimages/products/22356/razer-tartarus-chroma-03.png");
}

///
class RazerOrbweaver : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Orbweaver(-if01)?-event-kbd",
  0x0113,
  0,0,
  "https://assets.razerzone.com/eeimages/products/7305/razer-orbweaver-latest-04.png",
  "https://assets.razerzone.com/eeimages/products/7305/razer-orbweaver-latest-02.png",
  "https://assets.razerzone.com/eeimages/products/7305/razer-orbweaver-latest-03.png");
}


///
class RazerOrbweaverChroma : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Orbweaver_Chroma(-if01)?-event-kbd",
  0x0207,
  0,0,
  "https://assets2.razerzone.com/images/orbweaver-chroma/370604e681b07ee0ffc2047f569e438e-orbweaver-crhoma-gallery-02.jpg",
  "https://assets2.razerzone.com/images/orbweaver-chroma/8def7438b6f8d4faf24c9218daa07ad0-orbweaver-crhoma-gallery-03.jpg",
  "https://assets2.razerzone.com/images/orbweaver-chroma/518c021598fd22a51a714a1b276d1e9e-orbweaver-crhoma-gallery-04.jpg");
}

///
class RazerBlackWidowUltimate2012 : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_BlackWidow_Ultimate_2012(-if01)?-event-kbd",
    0x010D,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/22212/razer-blackwidow-ultimate-classic-gallery-4.png",
    "https://assets.razerzone.com/eeimages/products/22212/razer-blackwidow-ultimate-classic-gallery-1.png",
    "https://assets.razerzone.com/eeimages/products/22212/razer-blackwidow-ultimate-classic-gallery-2.png");
}


///
class RazerBlackWidowClassic : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_BlackWidow(-if01)?-event-kbd",
    0x011B,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/17559/razer-blackwidow-gallery-01.png",
    "https://assets.razerzone.com/eeimages/products/17559/razer-blackwidow-gallery-02.png",
    "https://assets.razerzone.com/eeimages/products/17559/razer-blackwidow-gallery-04.png");
}

///
class RazerBlackWidowClassicAlternate : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_BlackWidow(-if01)?-event-kbd",
    0x010E,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/17559/razer-blackwidow-gallery-01.png",
    "https://assets.razerzone.com/eeimages/products/17559/razer-blackwidow-gallery-02.png",
    "https://assets.razerzone.com/eeimages/products/17559/razer-blackwidow-gallery-04.png");
}

///
class RazerBlackWidowUltimate2013 : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_BlackWidow_Ultimate(_2013)?(-if01)?-event-kbd",
    0x011A,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/17561/razer-blackwidow-ultimate-gallery-02.png",
    "https://assets.razerzone.com/eeimages/products/17561/razer-blackwidow-ultimate-gallery-01.png",
    "https://assets.razerzone.com/eeimages/products/17561/razer-blackwidow-ultimate-gallery-04.png");
}


///
class RazerBlackWidowChroma : RazerDevice {
  mixin RazerDeviceFields!(".*BlackWidow_Chroma(-if01)?-event-kbd",
    0x0203,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/17557/razer-blackwidow-ultimate-gallery-01.png",
    "https://assets.razerzone.com/eeimages/products/17557/razer-blackwidow-ultimate-gallery-02.png",
    "https://assets.razerzone.com/eeimages/products/17557/razer-blackwidow-ultimate-gallery-04.png");
}

///
class RazerBlackWidowChromaV2 : RazerDevice {
  ///MATRIX_DIMS = [6, 22]

  mixin RazerDeviceFields!(".*BlackWidow_Chroma_V2(-if01)?-event-kbd",
    0x0221,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/26600/razer-blackwidow-chroma-v2-gallery-01-wristrest.png",
    "https://assets.razerzone.com/eeimages/products/26600/razer-blackwidow-chroma-v2-gallery-02-wristrest-green.png",
    "https://assets.razerzone.com/eeimages/products/26600/razer-blackwidow-chroma-v2-gallery-03-wristrest.png");
}

///
class RazerBlackWidowChromaTournamentEdition : RazerDevice {
  ///MATRIX_DIMS = [6, 22]

  mixin RazerDeviceFields!(".*BlackWidow_Tournament_Edition_Chroma(-if01)?-event-kbd",
    0x0209,
    6, 22,
    "https://assets2.razerzone.com/images/blackwidow-te-chroma/508721b4948304fe823e0d84b2ca114f-Blackwidow-TE-Chroma-Base_gallery2.jpg",
    "https://assets2.razerzone.com/images/blackwidow-te-chroma/87f7492792c72241c6d5bc302e36d46f-Blackwidow-TE-Chroma-Base_gallery3.jpg",
    "https://assets2.razerzone.com/images/blackwidow-te-chroma/918fc196cb8aec3e140316650d97a075-Blackwidow-TE-Chroma-Base_gallery5.jpg");
}

///
class RazerBlackWidowXChroma : RazerDevice {
  ///MATRIX_DIMS = [6, 22]

  mixin RazerDeviceFields!(".*BlackWidow_X_Chroma(-if01)?-event-kbd",
    0x0216,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/24325/razer-blackwidow-x-chroma-redo-1.png",
    "https://assets.razerzone.com/eeimages/products/24325/razer-blackwidow-x-chroma-redo-3.png",
    "https://assets.razerzone.com/eeimages/products/24325/razer-blackwidow-x-chroma-redo-4.png");
}


///
class RazerBlackWidowXTournamentEditionChroma : RazerDevice {
  ///MATRIX_DIMS = [6, 22]

  mixin RazerDeviceFields!(".*BlackWidow_X_Tournament_Edition_Chroma(-if01)?-event-kbd",
    0x021a,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/24362/razer-blackwidow-te-chroma-gallery-01.png",
    "https://assets.razerzone.com/eeimages/products/24362/razer-blackwidow-te-chroma-gallery-03.png",
    "https://assets.razerzone.com/eeimages/products/24362/razer-blackwidow-te-chroma-gallery-04.png");
}


///
class RazerBladeStealth : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Blade_Stealth(-if01)?-event-kbd",
    0x0205,
    6, 16,
    "https://assets.razerzone.com/eeimages/products/23914/razer-blade-stealth-gallery-05-v2.png",
    "https://assets.razerzone.com/eeimages/products/23914/razer-blade-stealth-gallery-08-v2.png",
    "https://assets.razerzone.com/eeimages/products/23914/razer-blade-stealth-gallery-01-v2.png");
}

///
class RazerBladeStealthLate2016 : RazerDevice {
  ///MATRIX_DIMS = [6, 16]

  mixin RazerDeviceFields!(".*Razer_Blade_Stealth(-if01)?-event-kbd",
    0x0220,
    6, 16,
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-15__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-22__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-02__store_gallery.png");
}

///
class RazerBladeLate2016 : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Blade(-if01)?-event-kbd",
    0x0224,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/26227/razer-blade-pro-gallery-07__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26227/razer-blade-pro-gallery-13__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26227/razer-blade-pro-gallery-01__store_gallery.png");
}

///
class RazerBladeQHD : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Blade(-if01)?-event-kbd",
    0x020F,
    6, 16,
    "https://assets.razerzone.com/eeimages/products/25684/rzrblade14-07__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/25684/rzrblade14-13__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/25684/rzrblade14-02__store_gallery.png");
}

///
class RazerBlackWidowXUltimate : RazerDevice {
  mixin RazerDeviceFields!(".*BlackWidow_Ultimate_2016(-if01)?-event-kbd",
    0x0217,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/24363/razer-blackwidow-x-ultimate-redo-1.png",
    "https://assets.razerzone.com/eeimages/products/24363/razer-blackwidow-x-ultimate-redo-3.png",
    "https://assets.razerzone.com/eeimages/products/24363/razer-blackwidow-x-ultimate-redo-4.png");
}

///
class RazerOrnataChroma : RazerDevice {
  mixin RazerDeviceFields!(".*Ornata_Chroma(-if01)?-event-kbd",
    0x021e,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/25713/razer-ornata-chroma-gallery-05.png",
    "https://assets.razerzone.com/eeimages/products/25713/razer-ornata-chroma-gallery-07.png",
    "https://assets.razerzone.com/eeimages/products/25713/razer-ornata-chroma-gallery-08.png");
}

///
class RazerOrnata : RazerDevice {
  mixin RazerDeviceFields!(".*Ornata(-if01)?-event-kbd",
    0x021f,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/25675/razer_ornata_001.png",
    "https://assets.razerzone.com/eeimages/products/25675/razer_ornata_003.png",
    "https://assets.razerzone.com/eeimages/products/25675/razer_ornata_004.png");
}

///
class RazerAnansi : RazerDevice {
  mixin RazerDeviceFields!(".*Anansi(-if01)?-event-kbd",
    0x010f,
    0, 0,
    "https://assets.razerzone.com/eeimages/products/58/razer-anansi-gallery-5.png",
    "https://assets.razerzone.com/eeimages/products/58/razer-anansi-gallery-3.png",
    "https://assets.razerzone.com/eeimages/products/58/razer-anansi-gallery-2.png");
}

///
class RazerDeathStalkerExpert : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_DeathStalker(-if01)?-event-kbd",
    0x0202,
    0, 0,
    "https://assets.razerzone.com/eeimages/products/771/razer-dstalk-gallery-5.png",
    "https://assets.razerzone.com/eeimages/products/771/razer-dstalk-gallery-3.png",
    "https://assets.razerzone.com/eeimages/products/771/razer-dstalk-gallery-2.png");
}

///
class RazerDeathStalkerChroma : RazerDevice {
  ///MATRIX_DIMS = [1, 6]

  mixin RazerDeviceFields!(".*DeathStalker_Chroma(-if01)?-event-kbd",
    0x0204,
    1, 6,
    "https://assets.razerzone.com/eeimages/products/22563/rzr_deathstalker_chroma_05.png",
    "https://assets.razerzone.com/eeimages/products/22563/rzr_deathstalker_chroma_03.png",
    "https://assets.razerzone.com/eeimages/products/22563/rzr_deathstalker_chroma_02.png");
}

///
class RazerBlackWidowChromaOverwatch : RazerDevice {
  ///MATRIX_DIMS = [6,22]

  mixin RazerDeviceFields!(".*BlackWidow_Chroma(-if01)?-event-kbd",
    0x0211,
    6, 22,
    "https://assets.razerzone.com/eeimages/products/23326/overwatch-razer-gallery-5.png",
    "https://assets.razerzone.com/eeimages/products/23326/overwatch-razer-gallery-3.png",
    "https://assets.razerzone.com/eeimages/products/23326/overwatch-razer-gallery-1.png");
}


///
class RazerBladeStealthMid2017 : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Blade_Stealth(-if01)?-event-kbd",
    0x022D,
    6, 16,
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-15__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-22__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-02__store_gallery.png");
}

///
class RazerBladePro2017FullHD : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Blade_ProFullHD(-if01)?-event-kbd",
    0x022F,
    6, 25,
    "https://assets.razerzone.com/eeimages/products/26227/razer-blade-pro-gallery-07__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26227/razer-blade-pro-gallery-13__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26227/razer-blade-pro-gallery-01__store_gallery.png");
}

///
class RazerBladeStealthLate2017 : RazerDevice {
  mixin RazerDeviceFields!(".*Razer_Blade_Stealth(-if01)?-event-kbd",
    0x0232,
    6, 16,
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-15__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-22__store_gallery.png",
    "https://assets.razerzone.com/eeimages/products/26727/rzrblade14-02__store_gallery.png");
}

///
enum RazerDevices = [
  "RazerNostromo",
  "RazerTartarus",
  "RazerTartarusChroma",
  "RazerOrbweaver",
  "RazerOrbweaverChroma",
  "RazerBlackWidowUltimate2012",
  "RazerBlackWidowClassic",
  "RazerBlackWidowClassicAlternate",
  "RazerBlackWidowUltimate2013",
  "RazerBlackWidowChroma",
  "RazerBlackWidowChromaV2",
  "RazerBlackWidowChromaTournamentEdition",
  "RazerBlackWidowXChroma",
  "RazerBlackWidowXTournamentEditionChroma",
  "RazerBladeStealth",
  "RazerBladeStealthLate2016",
  "RazerBladeLate2016",
  "RazerBladeQHD",
  "RazerBlackWidowXUltimate",
  "RazerOrnataChroma",
  "RazerOrnata",
  "RazerAnansi",
  "RazerDeathStalkerExpert",
  "RazerDeathStalkerChroma",
  "RazerBlackWidowChromaOverwatch",
  "RazerBladeStealthMid2017",
  "RazerBladePro2017FullHD",
  "RazerBladeStealthLate2017" ];

RazerDevice getRazerDevice(string name) {

  static foreach(Device; RazerDevices) {{
    mixin("auto device = new " ~ Device ~ "();");

    auto vid = format!"000%X"(device.usbVid)[$-4 .. $];
    auto pid = format!"000%X"(device.usbPid)[$-4 .. $];

    string part = vid ~ ":" ~ pid;

    if(name.indexOf(part) != -1) {
      return device;
    }
  }}

  assert(false, name ~ " is an unknown device.");
}

version(unittest) import fluent.asserts;

/// it should get the razer device by name
unittest {
  "0003:1532:0232.0004".getRazerDevice.usbPid.should.equal(0x0232);
}