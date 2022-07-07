# ProgressIndicators
Material Progress Indicators reserves code for instant usage of progress indicators using *material design 3* specifications in OpenHarmony.

## Features
The Progress Indicators are deployed with the following features -
* Linear and Circular type of indicators
* Determinate and Indeterminate classes
* Customized colors
* Customized size and strokewidth(for circular ones)

Some examples of the Progress Indicators handy to use are mentioned below.
![img.png](resources/TestCase_1.gif)
![img.png](resources/TestCase_2.gif)

## Dependencies
Add the below dependency in entry/package.json for using ProgressIndicators
```
"dependencies": {
    "@ohos/materialprogressbar": "file:../materialprogressbar"
  }
```

## Implementation 
The location to the source code is - MaterialProgressBar/src/main/ets/components/basic

The implementation starts with the setting the progress and the max progress.
![img.png](resources/ProgressBar.png)

Then the 'LinearPath' and 'CircularPath' files are built separately and the 'LinearComponent' and 'CircularComponent' files are built on top of them respectively.

The 'MaterialComponents' file in the main file in the directory that uses all the other files build the struct there along with some default parameters.
![img.png](resources/MaterialComponents.png)

The 'MaterialProgressBar' takes the input from the user and set the parameters.

## Importing
To use the ProgressIndicators, the components can be imported at once.
```ets
import { MaterialProgressBar, MaterialProgressStyle } from "@ohos/materialprogressbar"
```

## Usage and Variations
Material Progress Indicators provide majorly four kind of indicators which are as follows:
### Linear Determinate Progress Indicator
#### Implementing for usage
To use an instance of Linear Determinate Progress Indicator, the 'indeterminate' and 'indeterminateAngle' parameters need to be turned to 'false' in the 'MaterialHorizontal' component.
![img.png](resources/DeterminateLinear.png)

#### Instance
![img.png](resources/OutputDL.png)

### Linear Indeterminate Progress Indicator
#### Implementing for usage
To use an instance of Linear Determinate Progress Indicator, the 'indeterminate' and 'indeterminateAngle' parameters need to be turned to 'true' in the 'MaterialHorizontal' component.
![img.png](resources/IndeterminateLinear.png)

#### Instance
![img.png](resources/UsageIL.gif)

### Circular Determinate Progress Indicator
#### Implementing for usage
To use an instance of Linear Determinate Progress Indicator, the 'indeterminate' and 'indeterminateAngle' parameters need to be turned to 'false' in the 'MaterialCircular' component.
![img.png](resources/DeterminateCircular.png)

#### Instance
![img.png](resources/UsageDC.gif)

### Circular Indeterminate Progress Indicator
#### Implementing for usage
To use an instance of Linear Determinate Progress Indicator, the 'indeterminate' and 'indeterminateAngle' parameters need to be turned to 'true' in the 'MaterialCircular' component.
![img.png](resources/IndeterminateCircular.png)

#### Instance
![img.png](resources/UsageIC.gif)

## Compatibility
Supports OpenHarmony API version 8 and above

## Code Contribution
If you find any problems during usage, you can raise an [Issue](https://github.com/Applib-OpenHarmony/MaterialProgress/issues).

## Open source License
This project is based on [Apache License 2.0](https://github.com/Applib-OpenHarmony/MaterialProgress/blob/main/LICENSE), please enjoy and participate in open source freely.
