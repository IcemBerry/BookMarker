/**
 * Created by cacri on 2017/3/16.
 */
$(document).ready(function () {
    $.ajax({
        type: 'post',
        url: '/analysis',
        dataType: 'json',
        success: function (json) {
            drawReadCharts(json.progressList);
            drawNoteCharts(json.noteList);
        }
    });
});

function drawReadCharts(progressList) {
    if (!progressList || progressList.length <= 0) {
        return;
    }
    var myChart = echarts.init(document.getElementById('ReadTime'));
    var xData = new Array();
    var chartData = new Array();

    $.each(progressList, function (index, val) {
        xData.push(val.book.bookName);
        chartData.push(val.progress);
    });

    document.getElementById("bookNum").innerHTML = xData.length;

    var option = {
        title: {
            text: '阅读进度分析',
            x: 'left',
            textStyle: {
                fontWeight: 'normal'
            }
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: [{
            type: 'category',
            data: xData
        }],
        yAxis: [{
            type: 'value'
        }],
        series: {
            name: '进度',
            type: 'bar',
            barWidth: '30%',
            data: chartData
        }
    };
    myChart.setOption(option);
    window.addEventListener("resize",function(){
        myChart.resize();
    });
}

function drawNoteCharts(noteList) {
    if (!noteList || noteList.length <= 0) {
        return;
    }
    var myChart = echarts.init(document.getElementById('NoteTime'));
    var data = new Array();

    $.each(noteList, function (index, val) {
        var temp = new Array();
        temp[0] = getDay(noteList[index].noteDate);
        temp[1] = getHour(noteList[index].noteDate);
        temp[2] = noteList[index].note;
        temp[3] = noteList[index].book.bookName;
        // temp.push(getDay(this.noteDate),getHour(this.noteDate),this.note);
        data.push(temp);
    });

    var hours = ['0', '1', '2', '3', '4', '5', '6',
        '7', '8', '9', '10', '11',
        '12', '13', '14', '15', '16', '17',
        '18', '19', '20', '21', '22', '23'];
    var days = ['周六', '周五', '周四',
        '周三', '周二', '周一', '周日'];

    data = data.map(function (item) {
        return [item[1], item[0], item[2],item[3]];
    });
    document.getElementById("noteNum").innerHTML = data.length;

    var option = {
        title: {
            text: '历史摘录',
            link: '/note'
        },
        tooltip: {
            position: 'top',
            formatter: function (params) {
                return params.value[3]+'</br>'+params.value[2];
            }
        },
        grid: {
            left: 2,
            bottom: 10,
            right: 10,
            containLabel: true
        },
        xAxis: {
            type: 'category',
            data: hours,
            boundaryGap: true,
            splitLine: {
                show: true,
                lineStyle: {
                    color: '#999',
                    type: 'dashed'
                }
            },
            axisLine: {
                show: false
            }
        },
        yAxis: {
            type: 'category',
            data: days,
            boundaryGap: true,
            axisLine: {
                show: false
            }
        },
        series: [{
            name: 'Punch Card',
            type: 'scatter',
            symbolSize: function (val) {
                return val[2].length / 2;
            },
            data: data,
            animationDelay: function (idx) {
                return idx * 4;
            }
        }]
    };
    myChart.setOption(option);
    window.addEventListener("resize",function(){
        myChart.resize();
    });
}

function getDay(dateTime) {
    var d = new Date(dateTime);
    return d.getDay() + 1;
}
function getHour(dateTime) {
    var d = new Date(dateTime);
    return d.getHours();
}