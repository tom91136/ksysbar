/*
 *   Copyright 2015 Sebastian Kügler <sebas@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.4
import QtCharts 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.2 as QtControls

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras

import "../code/ksysbar.js" as KSysMon

Item {

    ChartView{
        id: histogram
        width: 400
        height: 300
        antialiasing: true
        legend.visible: false
        ValueAxis { 
            id: xAxis
            labelsVisible : false
            titleVisible : false
            lineVisible : false
            gridVisible : false
        }
        ValueAxis {
            id: yAxis
            min: 0.0
            max: 1.0
            labelsVisible : false 
            titleVisible : false
            lineVisible : false
            gridVisible : false
        }
      
    }

    PlasmaCore.DataSource {
           id: systemmonitor
           engine: "systemmonitor"
           onSourcesChanged :{
               console.info(JSON.stringify(sources).length)
           }
        //    sources 
           connectedSources: [
                KSysMon.CpuTotalLoad,
                KSysMon.CpuAverageClock,
                KSysMon.MemApplication,
                KSysMon.MemFree,
                KSysMon.MemUsed
                ]
           onNewData: KSysMon.onNewData(data, sourceName)
           interval: 1000
    }
    // Timer {
    //     interval: 1000
    //     running: true
    //     repeat: true
    //     onTriggered:{
    //         //  console.info(JSON.stringify(systemmonitor.sources + Math.random()));
    //     }
    // }
    Component.onCompleted: KSysMon.main()
    //     setInterval(x  ,1000);
    //     console.info(JSON.stringify(systemmonitor))
    //     for (var i in systemmonitor.sources) {
    //         console.info("> "+ i )
    //     }
    // }
}
