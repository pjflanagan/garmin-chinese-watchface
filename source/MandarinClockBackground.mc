using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {
  private var _yGap = 8;
  private var _yHalfGap = _yGap / 2;
  private var _xGap = 104;

  function initialize() {
    var dictionary = {
      :identifier => "Background",
    };

    Drawable.initialize(dictionary);
  }

  function draw(dc) {
    dc.setColor(
      Graphics.COLOR_TRANSPARENT,
      Application.getApp().getProperty("BackgroundColor")
    );
    dc.clear();

    // draw all the lines across
    dc.setColor(
      Application.getApp().getProperty("DesignColor"),
      Graphics.COLOR_TRANSPARENT
    );
    dc.setPenWidth(1);
    for (var lineY = 0; lineY < dc.getHeight(); lineY += _yGap) {
      dc.drawLine(0, lineY, dc.getWidth(), lineY);
    }

    // draw blockers over segments of the lines and draw circles on those blockers
    var patternOffset = 4; // starting at 4, 0 is too symmetrical
    for (var y = 0; y < dc.getHeight(); y += _yGap) {
      patternOffset++;
      var drawType = patternOffset % 6;
      var xStart = 0;
      if (drawType == 1) {
        xStart = (3 * _xGap) / 4;
      } else if (drawType == 2) {
        continue;
      } else if (drawType == 3) {
        xStart = _xGap / 4;
      } else if (drawType == 4) {
        continue;
      } else if (drawType == 5) {
        xStart = _xGap / 2;
      }
      for (var x = xStart; x < dc.getWidth(); x += _xGap) {
        // draw the background blocker first
        dc.setColor(
          Application.getApp().getProperty("BackgroundColor"),
          Graphics.COLOR_TRANSPARENT
        );
        // dc.setColor(0xff0000, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(x - _yGap, y, 2 * _yGap, _yGap + 1);

        // then draw two half circles
        dc.setColor(
          Application.getApp().getProperty("DesignColor"),
          Graphics.COLOR_TRANSPARENT
        );
        dc.setPenWidth(1);
        dc.drawArc(
          x - _yGap,
          y + _yHalfGap,
          _yHalfGap,
          Graphics.ARC_CLOCKWISE,
          90,
          270
        );
        dc.drawArc(
          x + _yGap,
          y + _yHalfGap,
          _yHalfGap,
          Graphics.ARC_COUNTER_CLOCKWISE,
          90,
          270
        );
      }
    }
  }
}
