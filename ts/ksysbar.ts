/// <reference path="qt.d.ts" />
/// <reference path="kf5_systemmonitor.d.ts" />

function isSeriesValue(v: any): v is SeriesValue {
    return "name" in v && "type" in v
}

const CpuTotalLoad  = "cpu/system/TotalLoad" 
const CpuAverageClock = "cpu/system/AverageClock"
const MemApplication = "mem/physical/application"
const MemFree = "mem/physical/free"
const MemUsed = "mem/physical/used"

declare const histogram : any
declare const xAxis : any
declare const yAxis : any


function show(thing: any){
    console.info(`${thing} => ${JSON.stringify(thing, null, 2)}`)
}

var chart : any
var series : any


function main(): void{
    console.info("Main entry")


    chart = histogram.createSeries(ChartView.SeriesTypeArea, "F", xAxis, yAxis)
    chart.color = "#FF5500"
    
    series = chart.upperSeries
}




function onNewData(data: any | SeriesValue, key : string): void {



    // console.info(`${s}:${JSON.stringify(data)}`) 

    if (isSeriesValue(data)) {
        
        switch (key) {
            case CpuTotalLoad:
                console.info(`${data.name}: ${data.value} ${data.units}`)
                const span = 1000 * 1200 // sec
                const now = Date.now().valueOf()
                xAxis.max = now;
                xAxis.min = now - span
                xAxis.tickCount = 0
                series.append( now , data.value / 100)
                console.info("L = " + series.count)
                // truncate 
                const tail = series.at(0)
                if(tail.x < xAxis.min) series.remove(0)
                break;
            default:
                break;
        }
    } else {
        // console.info(`???:${JSON.stringify(data)}`)
    }
}