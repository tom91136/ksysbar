KSysBar
========
A KDE plasmoid for system monitoring.

[](screenshot.png)

Existing solutions in KDE store does not fit my needs so I wrote my own.

Prerequisite:

 * KDE Plasma 5+
 * qt5-qtcharts(via `dnf install qt5-qtcharts`)

## Building

Build dependencies:

* `tsc`
* `cmake`
* `extra-cmake-modules`
* `qt5-qtdeclarative-devel`
* `kf5-plasma-devel`

Install them by

    dnf install cmake extra-cmake-modules qt5-qtdeclarative-devel kf5-plasma-devel 

For `tsc`, install via `yarn global add typescript` or `npm install -g typescript`

## Developing

Optional dependencies for development:

* `entr`
* `plasma-sdk`

Install them by

    dnf install entr plasma-sdk

This project uses TypeScript for QtQuick's JS. All `*.ts` sources are located in `./ts`, they will be placed 
in `./package/contents/code` upon compilation via `tsc`. See `.tsconfig.json` for more details.

For development, install all optional development dependencies then run

    ./dev.sh

The script starts `tsc` in watch mode and then starts `entr` with `plasmoidviewer` while watching for changes. 
The `plasmoidviewer` will restart whenever you modify any file in `./package` that matches `*.(qml|js)`