import Toybox.WatchUi;
import Toybox.Graphics;
import Toybox.Application.Properties;
import ChineseWatchFaceComplications;

class ChineseWatchFaceView extends WatchUi.WatchFace {
  function initialize() {
    WatchFace.initialize();
  }

  function onLayout(dc as Graphics.Dc) {
    setLayout(Rez.Layouts.WatchFace(dc));
  }

  function onShow() {}

  function onUpdate(dc as Graphics.Dc) {
    View.onUpdate(dc);

    // if this is dev, then show the version number at the top
    if (ChineseWatchFaceComplications.isDev()) {
      var theme = Properties.getValue("Theme");
      var color = ChineseWatchFaceComplications.THEME[theme][1]; // hourColor
      dc.setColor(color, Graphics.COLOR_TRANSPARENT);
      dc.drawText(
        dc.getWidth() / 2,
        24,
        Graphics.FONT_XTINY,
        ChineseWatchFaceComplications._version,
        Graphics.TEXT_JUSTIFY_CENTER
      );
    }
  }

  function onHide() {}

  function onExitSleep() {}

  function onEnterSleep() {}
}
