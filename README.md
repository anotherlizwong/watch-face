# watch-face
Learning Garmin SDK

## Scratchpad 

### Hunger 

Calculated by `2000 - calorie`. 

https://developer.garmin.com/connect-iq/api-docs/Toybox/ActivityMonitor/Info.html#calories-var

```
using Toybox.ActivityMonitor;
using Toybox.System;

var info = ActivityMonitor.getInfo();
var caloriesBurned = info.calories;

if (caloriesBurned !== null) {
    System.println("Calories burned today: " + caloriesBurned);
} else {
    System.println("Calories data is not available.");
}
```


### Heart

Calculated as actual, `battery_score`

https://developer.garmin.com/connect-iq/api-docs/Toybox/SensorHistory.html#getBodyBatteryHistory-instance_function

```
using Toybox.SensorHistory;
using Toybox.System;

// Function to get the Body Battery history
function getBodyBatteryHistory() {
    var options = {
        period: null, // You can specify a period here if needed
        order: SensorHistory.ORDER_NEWEST_FIRST
    };
    var iterator = SensorHistory.getBodyBatteryHistory(options);
    var sample = iterator.next();

    while (sample !== null) {
        System.println("Body Battery: " + sample.data);
        sample = iterator.next();
    }
}

// Call the function
getBodyBatteryHistory();

```
### Stress

Calculated as `100 - stress_score`. 

https://developer.garmin.com/connect-iq/api-docs/Toybox/ActivityMonitor/Info.html#stressScore-var

```
using Toybox.ActivityMonitor;
using Toybox.System;

function getStressScore() {
    var info = ActivityMonitor.getInfo();
    var stressScore = info.stressScore;

    if (stressScore !== null) {
        System.println("Current stress score: " + stressScore);
    } else {
        System.println("Stress score data is not available.");
    }
}

// Call the function
getStressScore();

```


https://developer.garmin.com/connect-iq/core-topics/graphics/

https://github.com/garmin/connectiq-apps/blob/master/watchfaces/TypedFace/source/Complications/ComplicatedBattery.mc
https://github.com/garmin/connectiq-apps/blob/master/watchfaces/TypedFace/resources/drawables/drawables.xml

### Complicated drawable
https://developer.garmin.com/connect-iq/core-topics/resources//#bitmaps
https://developer.garmin.com/connect-iq/api-docs/Toybox/WatchUi.html#loadResource-instance_function

### Arc draw
`dc.drawArc(_centerX, _centerY, _radius, Graphics.ARC_CLOCKWISE, 90, 90 - (360 * (percent / 100.0)));`
https://github.com/garmin/connectiq-apps/blob/master/watchfaces/TypedFace/source/Complications/ComplicatedDrawable.mc#L73

https://developer.garmin.com/connect-iq/api-docs/Toybox/Graphics/Dc.html#drawArc-instance_function

### trial and error

#### sprites
* uploading a bitmap larger than the screensize of the watch causes an error
* version 1.4.0 doesn't appear to allow slicing bitmaps
* there's still an opportunity to reuse parts of the pngs. for instance,
  * each png uses the same black border. that can be reused under each png
  * each png also has the same background, that can be reused under each png
  * each png has a solid color that is a percentage decrease, that can be a drawn rectangle underneath the png