var taname = document.getElementById('taname').value.split("', '");
var tastti = document.getElementById('tastti').value.split(", ");
var tacoti = document.getElementById('tacoti').value.split(", ");
var tacolo = document.getElementById('tacolo').value.split("', '");
var maxti = document.getElementById('time').value;
var ctx = document.getElementById('mychart-bar-stack');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {    
        labels: taname,
        datasets: [{
            label: '開始時間',
            data: tastti,
            backgroundColor: '#00000000',
            stack: 'stack-1',
        }, {
            label: '調理時間',
            data: tacoti,
            backgroundColor: tacolo,
            stack: 'stack-1',
        }],
    },
    options: {
        indexAxis: 'y',
        pointLabels: false,
        datalabels: {
            display: false
        },
        plugins: {
            legend: {
                display: false
            },
            title: {
                display: false
            },
        },

        scales: {
            x : {
              scaleLabel: {
                display: false
              },
              ticks : {
                min: 0,
                max: maxti,
                stepSize: 5,
                callback: function(tick) {

                    let min = Math.floor(tick % 3600 / 60);
                    let rem = tick % 60;
                    
                  return `${min}分${rem}秒`;
                }
              }
            },
            y : {
              scaleLabel: {
                display: false
                }
              }
          }
    }
});
