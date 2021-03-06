function ReadControles() { }


ReadControles.prototype.getData = function () {
    var controls = $('[IsSearch]');
    var result = {};
    var Key = "";
    $.each(controls, function (i, e) {
        var type = $(e).attr('data-ty');
        Key = $(e).attr('fld');
        switch (type) {
            case "DATETIME":
                result[Key] = $(e).val();
                break;
            case 'NUMERIC':
                result[Key] = $(e).val();
                break;
            case 'MULTISELECT':
                var vals = [];
                $('#' + $(e).attr('id') + ' input[type=checkbox]:checked').each(function () {
                    vals.push($(this).attr('value'));
                });
                
                result[Key] = vals;
                break;
            case 'SINGLESELECT':
                $('#' + $(e).attr('id') + ' input[type=checkbox]:checked').each(function () {
                    result[Key] = $(this).attr('value');
                });
                break;
            default:
                break;
        }
    });

    result.DocFromDate = $('#ContentPlaceHolder1_Frflddate').val();
    result.DocToDate = $('#ContentPlaceHolder1_Toflddate').val();
    result.SC = Rc.GetQueryString("SC");
    result.IsView = $('#hdnView').attr('Value');

    return result;
}


function getReport() {
    var obj = Rc.getData();
    var str1 = JSON.stringify(obj);

      $.ajax({
        type: "POST",
        url: "NewReportMasterEcomp.aspx/GetData",
        data: '{ "json": ' + str1 + ' }',
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: Rc.BindGrid,
        error: function (err) { alert('err');},
        failure: function (response) {
            $("#lblTab").text('Unknown error. Please contact your system administrator.');
        }
    });
}

ReadControles.prototype.BindGrid = function (result) {

    $("#mask").css("display", "none"); $("#loader").css("display", "none");
    if (!result.d.Success) {
        $("#lblTab").text(result.d.Message);
        var g = $("#kgrid").data("kendoGrid");

        if (g != null || g != undefined) {
            g.destroy();
           // g.empty();

            $("#kgrid").html('');
            $("#Chart0").html('');
            $("#Chart1").html('');
            $("#Chart2").html('');
            $("#Chart3").html('');
        }
        return false;
    }
    else {
        $("#lblTab").text('');
    }
    $("#lblCaption").text(result.d.Count + ' records found.');
    var Columns = result.d.Column;
    var CommanObj = { command: [{ name: "Details", text: "View Details", title: 'View Details', click: DetailHandler }], title: "Action", width: 100 };
    //var Columns = response.d.Column;
    Columns.splice(0, 0, CommanObj);
    var data = JSON.parse(result.d.Data);
    var chartData = result.d.Chart;
    //Rc.bindGrid("kgrid", data, Columns, true, true, true, 550);
    bindGrid1("kgrid", data, Columns, true, true, true, 550);
    BindChart(chartData);


  
}
var DetailHandler = function DetailHandler(e) {
    dataItem = this.dataItem($(e.currentTarget).closest("tr"));
    OpenWindow('DocDetail.aspx?DOCID=' + dataItem.DocID + '');
    //OpenWindow('DocDetail.aspx?DOCID="dataItem.tid"')
}

function OpenWindow(url) {
    var new_window = window.open(url, "List", "scrollbars=yes,resizable=yes,width=800,height=480");
    return false;
}

ReadControles.prototype.GetQueryString = function (param) {
    var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < url.length; i++) {
        var urlparam = url[i].split('=');
        if (urlparam[0] == param) {
            return urlparam[1];
        }
    }
}


function bindGrid1(gridDiv, Data1, columns, pageable, filterable, sortable, height) {

    $("#" + gridDiv).html('');

    var g = $("#" + gridDiv).data("kendoGrid");
   
       if (g != null || g != undefined) {
        g.destroy();
                
        $("#Chart0").html('');
        $("#Chart1").html('');
        $("#Chart2").html('');
        $("#Chart3").html('');
    }

    gridDiv = $("#" + gridDiv).kendoGrid({


        dataSource: {
            pageSize: 20,
            data: Data1
        },
        scrollable: {
            virtual: true
        },

        columns: columns,
        pageable: true,
        pageSize: 20,

        scrollable: true,
        reorderable: true,
        columnMenu: true,
        //dataBound: onDataBound,
        groupable: true,
        sortable: true,
        filterable: true,
        resizable: true,
        height: height,
        width: 1386,
        toolbar: ["excel"],
        excel: {
            fileName: "Act_Report.xlsx",
            filterable: true,
            pageable: true,
            allPages: true
        }

    });

}

function onDataBound(e) {
   // var grid = $("#kgrid").data("kendoGrid");
    //if (grid != undefined) {
    //    grid.destroy(); // destroy the Grid
    //   grid.empty();
    //}
    var gridData = grid.dataSource.view();
    for (var i = 0; i < gridData.length; i++) {
        var DOCID = gridData[i].DocID;
        grid.table.find("tr[data-uid='" + gridData[i].uid + "']").bind("click", { DOCID: DOCID }, DetailHandler);
    }
}


function BindChart(data) {
    $("#Chart0").html('');
    $("#Chart1").html('');
    $("#Chart2").html('');
    $("#Chart3").html('');
    $("#Chart4").html('');

    var arrCharts = data.split("==");

    for (var i = 0; i < arrCharts.length; i++) {
        if (arrCharts[i] == '') {
            continue;
        }
        var arr = arrCharts[i].split("|");
        var arrCate = new Array();
        var arrPer = new Array();
        var arrNotper = new Array();
        var arrperaftrdue = new Array();
        for (var j = 0; j < arr.length; j++) {
            var rowArr = arr[j].split(",");
            arrCate.push(rowArr[0]);
            arrPer.push(rowArr[1]);
            arrNotper.push(rowArr[2]);
            arrperaftrdue.push(rowArr[3]);
            var obj = {};
            obj.id = "#Chart" + i;

            $('#Chart' + i).css("height", "500px");

            obj.ChartText = "Summary Chart (Performed/Performed After Due Date/Delayed)"; //(Performed/Not Performed/Performed after due Date)
            obj.SeriesData = [{
                name: "Performed",
                data: arrPer,
                color: 'green'
            }, {
                name: "Performed After Due Date",
                data: arrNotper,
                color: 'red'
            },
            {
                name: "Delayed",
                data: arrperaftrdue,
                color: '#FF9900'
            }];
            obj.CategoryData = arrCate;
            createChart(obj);
        }

    }

   
}

function wrapSVGText(string, startingDy, width) {
 
    var words = string.split(' ');
    var text_element = document.getElementById('test');
    $(text_element).empty();
    var tspan_element = document.createElementNS("http://www.w3.org/2000/svg", "tspan");
    var text_node = document.createTextNode(words[0]);
 
    var htmlText = '<tspan dy="' + startingDy + '" >' + words[0];
 
    tspan_element.appendChild(text_node);
    text_element.appendChild(tspan_element);
 
    // Wrap the text when it exceeds the width
    for (var i = 1; i < words.length; i++)
    {
        
        

        // Find number of letters in string
        var len = tspan_element.firstChild.data.length;
        
        // Add next word
        tspan_element.firstChild.data += " " + words[i];
 
        if (tspan_element.getComputedTextLength() > width) {
            // Remove added word
            tspan_element.firstChild.data = tspan_element.firstChild.data.slice(0, len);
            // Create new tspan element
            tspan_element = document.createElementNS("http://www.w3.org/2000/svg", "tspan");
            text_node = document.createTextNode(words[i]);
 
            tspan_element.appendChild(text_node);
            text_element.appendChild(tspan_element);
            htmlText += '</tspan><tspan dy="12">' + words[i];
        }
        else
            htmlText += ' ' + words[i];
    }
    htmlText += '</tspan>';
    return htmlText;
}

function createChart(obj) {
    $(obj.id).html('');
    $(obj.id).kendoChart({
        title: {
            text: obj.ChartText
        },
        legend: {
            position: "bottom"
        },
        seriesDefaults: {
            type: "column"
        },
        series: obj.SeriesData,
        valueAxis: {
            line: {
                visible: false
            }
        },
        categoryAxis: {
            categories: obj.CategoryData
            ,
                majorGridLines: {
                visible: false,
                format: "{0}"
            },
            labels: {
                rotation: -90,
                template :' #= FormatLabel(value) # '
               // template: " #=value.length > 20?  value.toString().substring(0,20)  : value # "

            }
        },
        tooltip: {
            visible: true
            
        }
    });
}
function FormatLabel(value) {
  
    return value.toString().substring(0, 20) + "\n" + value.toString().substring(20,value.toString().length)
}


ReadControles.prototype.bindGrid1 = function (gridDiv, Data1, columns, pageable, filterable, sortable, height) {

    var g = $("#" + gridDiv).data("kendoGrid");

    if (g != null || g != undefined) {
        g.destroy();
      
        $("#" + gridDiv).html('');
    }

    gridDiv = $("#" + gridDiv).kendoGrid({
        dataSource: {
            pageSize: 20,
            data: Data1
        },
        scrollable: {
            virtual: true
        },
        columns: columns,
        pageable: true,
        pageSize: 20,
        scrollable: true,
        reorderable: true,
        groupable: true,
        sortable: true,
        filterable: true,
        resizable: true,
        height: height,
        toolbar: ["excel"],
        excel: {
            fileName: "Report.xlsx",
            filterable: true,
            pageable: true,
            allPages: true
        }
    });
}


var Rc = new ReadControles();