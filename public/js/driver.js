/**
 * Created with IntelliJ IDEA.
 * User: ILD
 * Date: 4/24/12
 * Time: 4:08 PM
 * To change this template use File | Settings | File Templates.
 */
var txt = "txt";
$(document).ready(function () {
    //list表格
    $.getJSON("/Drivers/listJson", {}, function (json) {
        json.columns[json.columns.length] = { title:"Actions", width:"300px", command:[
            {text:"Create Counsel", className:"create-counsel"},
            {text:"Delete", className:"delete-driver"},
            {text:"Edit", className:"edit-driver"}
        ]
        };
        var grid = $("#grid").kendoGrid({
            dataSource:{
                data:json.data,
                pageSize:5
            },
            columns:json.columns,
            scrollable:true,
            sortable:true,
            pageable:true,
            height:248,
            selectable:true
        }).data("kendoGrid");
    });

    //delete driver
    $("#grid").delegate(".delete-driver", "click", function (e) {

        driverno = $(this).parent().parent().find("td:first").html();
        $.get("delete",
            {
                no:driverno
            }, function (data) {
                $.getJSON("/drivers/listJson", {}, function (json) {
                    $("#grid").empty();
                    json.columns[json.columns.length] = { title:"Actions", width:"300px", command:[
                        {text:"Create Counsel", className:"create-counsel"},
                        {text:"Delete", className:"delete-driver"},
                        {text:"Edit", className:"edit-driver"}
                    ]
                    };
                    var grid = $("#grid").kendoGrid({
                        dataSource:{
                            data:json.data,
                            pageSize:5
                        },
                        columns:json.columns,
                        scrollable:true,
                        sortable:true,
                        pageable:true,
                        height:248,
                        selectable:true

                    }).data("kendoGrid");
                });
            });


    });

    //edit driver
    $("#grid").delegate(".edit-driver", "click", function (e) {
        $("#win-edit").show();
        $("#win-edit").kendoWindow({
                actions:["Refresh", "Maximize", "Minimize", "Close"],
                draggable:true,
                height:"300px",
                modal:true,
                resizable:false,
                title:"Edit Driver",
                width:"600px"
            }
        ).data("kendoWindow").center().open();


        var viewModel2 = kendo.observable({
            driver_no:$(this).parent().parent().find("td:first").html(),
            driver_name:$(this).parent().parent().find("td:nth-child(2)").html(),
            driver_description:$(this).parent().parent().find("td:nth-child(3)").html(),

            confirmed:false,
            update:function (e) {
                $.get("update",
                    {
                        no:$("#no_edit").val(),
                        name:$("#name_edit").val(),
                        description:$("#description_edit").val()
                    },
                    function (data) {
                        $.getJSON("/drivers/listJson", {}, function (json) {
                            $("#number").val("");
                            $("#name").val("");
                            $("#grid").empty();
                            json.columns[json.columns.length] = { title:"Actions", width:"300px", command:[
                                {text:"Create Counsel", className:"create-counsel"},
                                {text:"Delete", className:"delete-driver"},
                                {text:"Edit", className:"edit-driver"}
                            ]
                            };
                            var grid = $("#grid").kendoGrid({
                                dataSource:{
                                    data:json.data,
                                    pageSize:5
                                },
                                columns:json.columns,
                                scrollable:true,
                                sortable:true,
                                pageable:true,
                                height:248,
                                selectable:true

                            }).data("kendoGrid");
                        });
                    });

                this.set("confirmed", true);
                var kendoWindow = $("#win-edit").data("kendoWindow").close();
                //刷新
                e.preventDefault();
            }
        });
        kendo.bind($("#edit-form"), viewModel2);

    });


    //create counsel
    $("#grid").delegate(".create-counsel", "click", function (e) {
        new_div = $("#new_div");
        if ($(this).parent().html() === new_div.html()) {
            txt = "";
        }
        else {
            txt = $(this).parent().parent().find("td:first").next().html();
        }
        $("#win").show();
        $("#win").kendoWindow({
                actions:["Refresh", "Maximize", "Minimize", "Close"],
                draggable:true,
                height:"300px",
                modal:true,
                resizable:false,
                title:"Create Counselling",
                width:"600px"
            }
        ).data("kendoWindow").center().open();


        var viewModel = kendo.observable({
            driver:txt,
            confirmed:false,
            create:function (e) {
                host = $("#dropDownList").val();
                if ("Select Host" == host) {
                    alert("select a host");
                }
                startdate = $("#date").val();
                enddate = startdate;
                starttime = $("#starttime").val();
                endtime = $("#endtime").val();
                remark = $("#remark").val();
                url = "/counselling/saveCounselling";
                txt = $("#driver_no").val();
                $.get(url,

                    {
                        Userlogin:host,
                        driverNo:txt,
                        startTime:startdate + starttime,
                        endTime:enddate + endtime,
                        remark:remark
                    },
                    function (data) {
                    });
                this.set("confirmed", true);
                var kendoWindow = $("#win").data("kendoWindow").close();
                //刷新
                e.preventDefault();
            }
        });
        kendo.bind($("#counselling-form"), viewModel);

    });


    $("#dropDownList").kendoDropDownList();
    //窗口
    $("#win-edit").hide();
    $("#add-win").hide();
    $("#win").hide();

    //下拉菜单
    $("#hosts").kendoDropDownList();

    // DatePicker, TimePicker
    $("#date").kendoDatePicker();
    $("#starttime,#endtime").kendoTimePicker({
        interval:15
    });


    //search driver
    var searchModel = kendo.observable({
        search:function (e) {
            number = $("#number").val();
            name = $("#name").val();

            $.getJSON("/drivers/searchJson",
                {
                    number:number,
                    name:name
                },
                function (json) {
                    $("#grid").empty();
                    json.columns[json.columns.length] = { title:"Actions", width:"300px", command:[
                        {text:"Create Counsel", className:"create-counsel"},
                        {text:"Delete", className:"delete-driver"},
                        {text:"Edit", className:"edit-driver"}
                    ]
                    };
                    var grid = $("#grid").kendoGrid({
                        dataSource:{
                            data:json.data,
                            pageSize:5
                        },
                        columns:json.columns,
                        scrollable:true,
                        sortable:true,
                        pageable:true,
                        height:248,
                        selectable:true

                    }).data("kendoGrid");
                });
            e.preventDefault();
        }
    });

    kendo.bind($("#search-form"), searchModel);


    //add driver
    $("#add-driver").click(function () {
        $("#add-win").show();
        $("#add-win").kendoWindow({
                actions:["Refresh", "Maximize", "Minimize", "Close"],
                draggable:true,
                height:"300px",
                modal:true,
                resizable:false,
                title:"add driver",
                width:"600px"
            }
        ).data("kendoWindow").center().open();


        var viewModel1 = kendo.observable({
            confirmed:false,
            add:function (e) {
                no = $("#no").val();
                name = $("#name_").val();
                description = $("#description").val();
                url = "/drivers/add";
                $.get(url,
                    {
                        no:no,
                        name:name,
                        description:description
                    },
                    function (data) {
                    }
                );

                this.set("confirmed", true);
                var kendoWindow = $("#add-win").data("kendoWindow").close();
                //刷新
                e.preventDefault();

                $("#grid").empty();
                $.getJSON("/drivers/listJson", {}, function (json) {
                    json.columns[json.columns.length] = { title:"Actions", width:"300px", command:[
                        {text:"Create Counsel", className:"create-counsel"},
                        {text:"Delete", className:"delete-driver"},
                        {text:"Edit", className:"edit-driver"}
                    ]
                    };
                    var grid = $("#grid").kendoGrid({
                        dataSource:{
                            data:json.data,
                            pageSize:5
                        },
                        columns:json.columns,
                        scrollable:true,
                        sortable:true,
                        pageable:true,
                        height:248,
                        selectable:true

                    }).data("kendoGrid");
                });
            }
        });
        kendo.bind($("#add-form"), viewModel1);

    });

//  TreeView
    $("#treeview").kendoTreeView({
        checkChildren:true,
        template:kendo.template($("#treeview-template").html()),

        checkboxTemplate:kendo.template($("#treeview-checkbox-template").html()),

        dataSource:treedata
    });

});




