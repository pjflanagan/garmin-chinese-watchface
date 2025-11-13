import Toybox.Lang;
import Toybox.Graphics;
import Toybox.Time;

module Complications {
  function normalizeDegrees(degrees as Number) as Number {
    if (degrees < 0) {
      return degrees + 360;
    } else if (degrees >= 360) {
      return degrees - 360;
    }
    return degrees;
  }
}
