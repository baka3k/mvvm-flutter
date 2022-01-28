# base_source

Coding pattern MVVM - BaseSource Flutter by GetX
![image info](/readme/mvvm.png)
## Features
- [x] Coding pattern MVVP for Flutter by GetX
- [x] Apply Repository Pattern for Model 
- [x] Apply compute() for json parse - restful api - GetConnect
- [x] Apply DI ViewModel by Bindings Getx
- [x] Support multi-language
## Require
This project is using getX(4.3.8 or upper)
```
dependencies:
  get: ^4.3.8
```
## Languages
- Install [get_cli](https://pub.dev/packages/get_cli/versions/1.3.10) for generate Languages
- Assump that language place in assets/locales(en_US.json,zh_CN.json..etc)
- run below command to generate languages
```
get generate locales assets/locales
```

Change Language
```
Update
Text(LocaleKeys.locale_title) 
to 
Text(LocaleKeys.locale_title.tr), // .tr 
.....

LanguageService.to.changeLocale(Locale('vi', 'VN'));                 
LanguageService.to.changeLocale(Locale('en', 'US'));
```

### Add Google Map
If you want to use Google Map on this project - please create API key from https://console.cloud.google.com/
and add your key in 3 files:

1. app/feature/map/secrets.dart
```
class Secrets {
  // Add your Google Maps API Key here
  static const API_KEY = "YOU GOOGLE MAP API KEY";
}

```
2. Specify your API key in the Android application manifest android/app/src/main/AndroidManifest.xml
```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOU GOOGLE MAP API KEY"/>
```
3. Specify your API key in the IOS applicationios: Runner/AppDelegate.m
```
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSServices provideAPIKey:@"YOU GOOGLE MAP API KEY"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
```
Find more infomation: https://pub.dev/packages/google_maps_flutter

### Plugins
N/A

| Plugin | README | LICENSE | URL |
| ------ | ------ |-------|-------|
| GetX|State manager, connection, multilanguage..etc|MIT|https://pub.dev/packages/get
|connectivity_plus|Check network connection|BSD-3-Clause|https://pub.dev/packages/connectivity_plus
|google_maps_flutter|Show Google map|BSD-3-Clause|https://pub.dev/packages/google_maps_flutter
|flutter_polyline_points|Showing route/polyline on maps|MIT|https://pub.dev/packages/flutter_polyline_points
 
### TO DO

- N/A

License
----

MIT 2.0
Copyright <2021> <baka3k@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

