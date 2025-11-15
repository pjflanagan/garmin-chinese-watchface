import Toybox.WatchUi;
import Toybox.Graphics;

class ChineseWatchFaceView extends WatchUi.WatchFace {
    function initialize() {
        WatchFace.initialize();
    }

    function onLayout(dc as Graphics.Dc) {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() {
    }

    function onUpdate(dc as Graphics.Dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }

    function onExitSleep() {
    }

    function onEnterSleep() {
    }
}
