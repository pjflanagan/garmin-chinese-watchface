import Toybox.Lang;
import Toybox.Graphics;
import Toybox.Time;

module Complications {
  
  // [timeOfDayColor, hourColor, minuteColor]
  var THEME as Array<Array<Number>> = [
      [0x55aaff, 0x00ffaa, 0xffffff], // waves
      [0xffffff, 0xffffff, 0xffffff], // night
      [0x55aaff, 0xffffff, 0xffffff], // sky
      [0xffffff, 0xffffff, 0xffffff], // chinese new year
  ];

  function normalizeDegrees(degrees as Number) as Number {
    if (degrees < 0) {
      return degrees + 360;
    } else if (degrees >= 360) {
      return degrees - 360;
    }
    return degrees;
  }
}
