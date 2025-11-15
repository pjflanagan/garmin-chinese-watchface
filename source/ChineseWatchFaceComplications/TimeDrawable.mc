import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Lang;
import Toybox.Application.Properties;
import Toybox.Graphics;
import ChineseWatchFaceComplications;

module ChineseWatchFaceComplications {
  class TimeDrawable extends WatchUi.Drawable {
    private var _model as ChineseWatchFaceComplications.TimeModel;
    private var _fontWidth;
    private var _font as WatchUi.Resource?;
    private var _fontData as WatchUi.Resource?;

    private const chToIndexMap = {
      "零" => 0,
      "一" => 1,
      "二" => 2,
      "三" => 3,
      "四" => 4,
      "五" => 5,
      "六" => 6,
      "七" => 7,
      "八" => 8,
      "九" => 9,
      "十" => 10,
      "兩" => 11,
      "點" => 12,
      "整" => 13,
      "分" => 14,
      "秒" => 15,
      "日" => 16,
      "月" => 17,
      "天" => 18,
      "星" => 19,
      "期" => 20,
      "上" => 21,
      "下" => 22,
      "早" => 23,
      "中" => 24,
      "晚" => 25,
      "午" => 26,
      "傍" => 27,
      "凌" => 28,
      "晨" => 29,
      "清" => 30,
      "半" => 31,
    };

    function initialize(
      params as
        {
          :identifier as Object,
          :dc as Graphics.Dc,
        }
    ) {
      _model = new ChineseWatchFaceComplications.TimeModel();
      _font = WatchUi.loadResource(Rez.Fonts.font_zh);
      _fontData = WatchUi.loadResource(Rez.JsonData.fontData);
      _fontWidth = params[:dc].getFontHeight(_font);

      var options = {
        :x => params[:x],
        :y => params[:y],
        :identifier => params[:identifier],
      };
      Drawable.initialize(options);
    }

    private function drawChineseTextHorizontal(
      dc as Graphics.Dc,
      text as String,
      color as Number,
      y as Number
    ) {
      if (text.length() == 0) {
        return;
      } else if (_font == null || _fontData == null) {
        return;
      }

      // modify x according to justification
      var justification = Properties.getValue("AlignText");
      var x = Properties.getValue("OffsetX");
      var pixels = text.length() * _fontWidth;
      switch (justification) {
        case Graphics.TEXT_JUSTIFY_CENTER:
          x = dc.getWidth() / 2 - pixels / 2;
          break;
        case Graphics.TEXT_JUSTIFY_RIGHT:
          x = dc.getWidth() - pixels - x;
          break;
      }

      dc.setColor(color, Graphics.COLOR_TRANSPARENT);
      for (var i = 0; i < text.length(); i++) {
        var ch = text.substring(i, i + 1);
        if (chToIndexMap.hasKey(ch)) {
          var data = _fontData[chToIndexMap.get(ch)] as Array<Number>;
          drawTiles(dc, data, x + i * _fontWidth, y);
        }
      }
    }

    // Sourced from https://github.com/sunpazed/garmin-tilemapper
    private function drawTiles(
      dc as Graphics.Dc,
      data as Array<Number>,
      xOffset as Number,
      yOffset as Number
    ) {
      for (var i = 0; i < data.size(); i++) {
        var packedValue = data[i] as Number;
        var char = packedValue & 0x00000fff;
        var xPosition = (packedValue & 0x003ff000) >> 12;
        var yPosition = (packedValue & 0xffc00000) >> 22;
        dc.drawText(
          xOffset + xPosition,
          yOffset + yPosition,
          _font,
          char.toNumber().toChar(),
          Graphics.TEXT_JUSTIFY_LEFT
        );
      }
    }

    // Update the view
    function draw(dc as Graphics.Dc) as Void {
      var theme = Properties.getValue("Theme");
      var themeColorPalette = ChineseWatchFaceComplications.THEME[theme];
      var timeOfDayColor = themeColorPalette[0];
      var hourColor = themeColorPalette[1];
      var minuteColor = themeColorPalette[2];
      var shadowColor = themeColorPalette[3];

      // TODO: v1.0.4
      var offsetY = Properties.getValue("OffsetY") as Number;
      var paddingWidth = Properties.getValue("Padding");

      // ==== drawing Chinese text
      drawChineseTextHorizontal(
        dc,
        _model._timeOfDayText,
        shadowColor,
        offsetY + 2
      );
      drawChineseTextHorizontal(
        dc,
        _model._timeOfDayText,
        timeOfDayColor,
        offsetY
      );

      drawChineseTextHorizontal(
        dc,
        _model._hourText,
        shadowColor,
        offsetY + _fontWidth + paddingWidth + 2
      );
      drawChineseTextHorizontal(
        dc,
        _model._hourText,
        hourColor,
        offsetY + _fontWidth + paddingWidth
      );

      drawChineseTextHorizontal(
        dc,
        _model._minuteText,
        shadowColor,
        offsetY + _fontWidth * 2 + paddingWidth + 2
      );
      drawChineseTextHorizontal(
        dc,
        _model._minuteText,
        minuteColor,
        offsetY + _fontWidth * 2 + paddingWidth
      );
    }
  }
}
