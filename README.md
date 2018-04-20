# ChartJS for Seaside

#### Linux/OSX builds
Master: [![Build Status](https://travis-ci.org/DuneSt/ChartJs.svg?branch=master)](https://travis-ci.org/DuneSt/ChartJs)| Development: [![Build Status](https://travis-ci.org/DuneSt/ChartJs.svg?branch=development)](https://travis-ci.org/DuneSt/ChartJs)

#### Windows builds
Master: [![Build status](https://ci.appveyor.com/api/projects/status/dhmgabjvvhmg1r77/branch/master?svg=true)](https://ci.appveyor.com/project/jecisc/chartjs/branch/master) | Latest commit: [![Build status](https://ci.appveyor.com/api/projects/status/dhmgabjvvhmg1r77?svg=true)](https://ci.appveyor.com/project/jecisc/chartjs)


This project is an implementation of ChartJs in Seaside with a model associated to charts.

It uses Stylesheet for customization and can be used in local network.

# Documentation

## Version management 

This project use semantic versionning to define the releases. This mean that each stable release of the project will get associate a version number of the form `vX.Y.Z`. 

- **X** define the major version number
- **Y** define the minor version number 
- **Z** define the patch version number

When a release contains only bug fixes, the patch number increase. When the release contains new features backward compatibles, the minor version increase. When the release contains breaking changes, the major version increase. 

Thus, it should be safe to depend on a fixed major version and moving minor version of this project.

## Install ChartJs Seaside

To install ChartJs on your Pharo image you can execute:

```Smalltalk
    Metacello new
    	githubUser: 'DuneSt' project: 'ChartJs' commitish: 'master' path: 'src';
    	baseline: 'ChartJs';
		onUpgrade: [ :e | e useIncoming ];
    	onWarningLog;
    	load
```

To add ChartJs Seaside to your baseline just add this:

```Smalltalk
    spec
    	baseline: 'ChartJs'
    	with: [ spec repository: 'github://DuneSt/ChartJs:v1.x.x/src' ]
```

Note that you can replace the #v1.x.x by a branch name as #master, #development or a tag as #v1.0.0, #v1.? or #v1.2.? or a commit SHA.

## Getting started

### Add the right libraries

To use ChartJs for Seaside you will need to add JQuery and ChartJs libraries to your application:

```Smalltalk
	(WAAdmin register: self asApplicationAt: 'myApplication')
		addLibrary: ChartJsLibrary;
		addLibrary: JQDeploymentLibrary
```

## Examples

TODO - Cyril: I'll probably try to deploy a demo but I need timo to improve the current demo and deploy it...

## Latest supported Dependency

- [ChartJs v1.0.1](https://github.com/chartjs/Chart.js/releases/tag/v1.0.1)

## Smalltalk versions compatibility

| ChartJs version 	| Compatible Pharo versions 	|
|---------------	|---------------------------	|
| development      	| Pharo 61                  	|

## Contact

If you have any question or problem do not hesitate to open an issue or contact cyril (a) ferlicot.me or guillaume.larcheveque (a) gmail.com