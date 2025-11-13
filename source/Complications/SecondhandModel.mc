import Toybox.Application;
import Toybox.SensorHistory;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Time;
import Toybox.Complications;

module Complications {
  class SecondHandModel {
    public var _secondOfMinute as Number; //[0, 59]

    public function initialize() {
      var clockTime = System.getClockTime();
      _secondOfMinute = clockTime.sec;
    }

    public function updateModel() as Void {
      var clockTime = System.getClockTime();
      _secondOfMinute = clockTime.sec;
    }
  }
}
