import Toybox.Application;
import Toybox.SensorHistory;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Time;
import Toybox.Complications;

module Complications {
  class TimeModel {
    public var _timeOfDayText as String;
    public var _hourText as String;
    public var _minuteText as String;

    private const numberToChMap = {
      0 => "零",
      1 => "一",
      2 => "二",
      3 => "三",
      4 => "四",
      5 => "五",
      6 => "六",
      7 => "七",
      8 => "八",
      9 => "九",
      10 => "十",
      11 => "十一",
      12 => "十二",
      -2 => "兩",
    };

    public function initialize() {
      _timeOfDayText = "";
      _hourText = "";
      _minuteText = "";
      setTimeText();
    }

    public function updateModel() as Void {
      setTimeText();
    }

    private function setTimeText() as Void {
      // Get the current time and format it correctly
      var clockTime = System.getClockTime();
      var hour = clockTime.hour;
      var minutes = clockTime.min;

      // ==== determine time of day
      if (hour >= 0 && hour < 5) {
        _timeOfDayText = "凌晨";
      } else if (hour >= 5 && hour < 7) {
        //given sunrise is at 7
        _timeOfDayText = "清晨";
      } else if (hour >= 7 && hour < 11) {
        _timeOfDayText = "早上";
      } else if (hour >= 11 && hour < 13) {
        _timeOfDayText = "中午";
      } else if (hour >= 13 && hour < 18) {
        _timeOfDayText = "下午";
      } else if (hour >= 18 && hour < 20) {
        //given sunset is at 20
        _timeOfDayText = "傍晚";
      } else if (hour >= 20 && hour < 24) {
        _timeOfDayText = "晚上";
      }

      // ==== determine hour
      if (hour > 12) {
        hour = hour - 12;
      }
      if (hour == 2) {
        _hourText = numberToChMap[-hour] + "點";
      } else {
        _hourText = numberToChMap[hour] + "點";
      }

      // ==== determine minute
      if (minutes == 0) {
        _minuteText = "整";
      } else if (minutes == 30) {
        _minuteText = "半";
      } else if (minutes < 10) {
        _minuteText = numberToChMap[minutes] + "分";
      } else if (minutes < 20) {
        if (minutes % 10 == 0) {
          _minuteText = "十分";
        } else {
          _minuteText = "十" + numberToChMap[minutes % 10] + "分";
        }
      } else {
        if (minutes % 10 == 0) {
          _minuteText = numberToChMap[minutes / 10] + "十分";
        } else {
          _minuteText =
            numberToChMap[minutes / 10] +
            "十" +
            numberToChMap[minutes % 10] +
            "分";
        }
      }
    }
  }
}
