import Toybox.Lang;
import Toybox.Graphics;
import Toybox.Time;
import Toybox.Math;

module ChineseWatchFaceComplications {
  var _version = "1.0.7";

  function isDev() as Boolean {
    return _version.substring(0, 3).equals("dev");
  }

  // [timeOfDayColor, hourColor, minuteColor, shadowColor]
  var THEME as Array<Array<Number> > = [
    [0x55aaff, 0x00ffaa, 0xffffff, 0x000000], // 0 waves
    [0x55aaff, 0xffff55, 0xffffff, 0x000000], // 1 sky
    [0xff55aa, 0xff00aa, 0xffffff, 0x000000], // 2 night
    [0x55aaff, 0x0055ff, 0x000000, 0xffffff], // 3 snow
    [0xffffaa, 0xff55aa, 0xffffff, 0x000000], // 4 lotus
    [0xffff55, 0xffff00, 0xffffff, 0x000000], // 5 chinese new year
    [0xaaffaa, 0xffaa00, 0xffffff, 0x000000], // 6 green tea
    [0xffffaa, 0xffffff, 0xffffff, 0x000000], // 7 boba
  ];

  function normalizeDegrees(degrees as Number) as Number {
    if (degrees < 0) {
      return degrees + 360;
    } else if (degrees >= 360) {
      return degrees - 360;
    }
    return degrees;
  }

  function min(a as Number or Float, b as Number or Float) as Number or Float {
    if (a < b) {
      return a;
    } else {
      return b;
    }
  }

  function abs(a as Number or Float) as Number or Float {
    if (a < 0) {
      return -a;
    } else {
      return a;
    }
  }

  function getChordLength(
    radius as Number,
    yOffset as Number
  ) as Float {
    // chord length = 2 * sqrt(r^2 - d^2)
    var distanceFromCenter = abs(yOffset);
    return (
      2 * Math.sqrt(radius * radius - distanceFromCenter * distanceFromCenter)
    );
  }
}
