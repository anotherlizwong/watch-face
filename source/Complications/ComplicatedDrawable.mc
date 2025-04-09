import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

class ComplicationDrawable extends WatchUi.Drawable {
    private var _background as BitmapType = WatchUi.loadResource(Rez.Drawables.brainFull);
    // private var _radius as Number;
    // private var _centerX as Number;
    // private var _centerY as Number;


    //! Constructor
    //! @param params Drawable arguments
    public function initialize(params as { :identifier as Object, :locX as Numeric, :locY as Numeric, :width as Numeric, :height as Numeric }) {   

        // Use the given point as the center point
        var backgroundWidth = _background.getWidth();
        var backgroundHeight = _background.getHeight();

        // _centerX = params[:locX];
        // _centerY = params[:locY];
        // _radius = backgroundHeight / 2;

        var options = {
            // :locX => params[:locX] - (backgroundWidth / 2),
            // :locY => params[:locY] - (backgroundHeight / 2),
            // :identifier => params[:identifier]
        };

        // Initialize superclass
        Drawable.initialize(options);
    }

    //! Set the model updater for the complication
    //! @param updater Model updater for the complication or null to disable
    // public function setModelUpdater(updater as ModelUpdater?) as Void {
    //     _updater = updater;
    // }

    //! Draw the complication
    //! @param dc Draw context
    public function draw(dc as Dc) as Void {            
    // 13
            dc.drawBitmap(13, 40, _background);   
            // Draw the icon
            // dc.drawBitmap(_centerX - (iconWidth / 2), _centerY - (iconHeight / 2), icon);            

         
        
    }
}