/**
 * Created with IntelliJ IDEA.
 * User: ILD
 * Date: 4/24/12
 * Time: 4:08 PM
 * To change this template use File | Settings | File Templates.
 */
$(document).ready(function () {
    //list表格
    $.getJSON("/vehicles/listJson", {}, function (json) {
        json.columns[json.columns.length] = {
            title:"Actions", width:"200px", command:[
                {text:"Delete", className:"delete-vehicle"},
                {text:"Edit", className:"edit-vehicle"}
            ] };
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

    //    //窗口
    $("#win-edit").hide();
    $("#add-win").hide();
    $("#win").hide();
    $("#del-win").hide();

    $("#grid").delegate(".delete-vehicle", "click", function (e) {
        vehicleno = $(this).parent().parent().find("td:nth-child(2)").html();
        $.get("delete",
            {
                license:vehicleno
            }, function (data) {
                $.getJSON("/vehicles/listJson", {}, function (json) {
                    $("#grid").empty();
                    json.columns[json.columns.length] = {
                        title:"Actions", width:"200px", command:[
                            {text:"Delete", className:"delete-vehicle"},
                            {text:"Edit", className:"edit-vehicle"}
                        ] };
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




// edit vehicle
    $("#grid").delegate(".edit-vehicle", "click", function (e) {
        $("#win-edit").show();
        $("#win-edit").kendoWindow({
                actions:["Refresh", "Maximize", "Minimize", "Close"],
                draggable:true,
                height:"300px",
                modal:true,
                resizable:false,
                title:"Edit Vehicle",
                width:"600px"
            }
        ).data("kendoWindow").center().open();


        var viewModel2 = kendo.observable({
            vehicle_no:$(this).parent().parent().find("td:first").html(),
            vehicle_license:$(this).parent().parent().find("td:nth-child(2)").html(),
            vehicle_fleet:$(this).parent().parent().find("td:nth-child(3)").html(),
            vehicle_device:$(this).parent().parent().find("td:nth-child(4)").html(),
            vehicle_cctvip:$(this).parent().parent().find("td:nth-child(6)").html(),
            vehicle_type:$(this).parent().parent().find("td:nth-child(7)").html(),
            vehicle_description:$(this).parent().parent().find("td:nth-child(5)").html(),

            confirmed:false,
            update:function (e) {
                $.get("update",
                    {
                        number:$("#no_edit").val(),
                        license:$("#license_edit").val(),
                        fleetName:$("#fleet_edit").val(),
                        deviceName:$("#device_edit").val(),
                        description:$("#description_edit").val(),
                        cctvIp:$("#cctvip_edit").val(),
                        type:$("#type_edit").val()
                    },
                    function (data) {
                        $.getJSON("/vehicles/listJson", {}, function (json) {
                            $("#grid").empty();
                            json.columns[json.columns.length] = {
                                title:"Actions", width:"200px", command:[
                                    {text:"Delete", className:"delete-vehicle"},
                                    {text:"Edit", className:"edit-vehicle"}
                                ] };
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
                //刷新
                e.preventDefault();
            }
        });
        kendo.bind($("#edit-form"), viewModel2);

    });


    var searchModel = kendo.observable({
        search:function (e) {
            number = $("#number").val();
            license = $("#license").val();
            fleetName = $("#dropDownList").val();
            deviceName = $("#dropDownList2").val();
            if ("Select Fleet" == fleetName) {
                fleetName = "";
            }
            if ("Select Device" == deviceName) {
                deviceName = "";
            }
            $.getJSON("/vehicles/searchJson",
                {
                    number:number,
                    license:license,
                    fleetName:fleetName,
                    deviceName:deviceName

                },
                function (json) {
                    $("#grid").empty();
                    json.columns[json.columns.length] = {
                        title:"Actions", width:"300px", command:[
                            {text:"Delete", className:"delete-vehicle"},
                            {text:"Edit", className:"edit-vehicle"}
                        ] };

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
//
//
    //add vehicle
    $("#add-vehicle").click(function () {
        $("#add-win").show();
        $("#add-win").kendoWindow({
            actions:["Refresh", "Maximize", "Minimize", "Close"],
            draggable:true,
            height:"300px",
            modal:true,
            resizable:false,
            title:"add vehicle",
            width:"600px"
        }).data("kendoWindow").center().open();


        var viewModel1 = kendo.observable({
//            confirmed:false,
            add:function (e) {
                number = $("#no_add").val();
                license = $("#license_add").val();
                fleetName = $("#dropDownList1").val();
                deviceName = $("#dropDownList3").val();
                description = $("#description_add").val();
                cctvIp = $("#cctvip_add").val();
                type = $("#type_add").val();
                url = "/vehicles/add";
                $.get(url,
                    {
                        number:number,
                        license:license,
                        fleetName:fleetName,
                        deviceName:deviceName,
                        description:description,
                        cctvIp:cctvIp,
                        type:type
                    },
                    function (data) {
                        $.getJSON("/vehicles/listJson", {}, function (json) {
                            $("#grid").empty();
                            json.columns[json.columns.length] = {
                                title:"Actions", width:"200px", command:[
                                    {text:"Delete", className:"delete-vehicle"},
                                    {text:"Edit", className:"edit-vehicle"}
                                ] };
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
                );

//                this.set("confirmed", true);
                //刷新
                e.preventDefault();
            }
        });
        kendo.bind($("#add-form"), viewModel1);

    });
    $("#dropDownList").kendoDropDownList();
    $("#dropDownList1").kendoDropDownList();
    $("#dropDownList2").kendoDropDownList();
    $("#dropDownList3").kendoDropDownList();

    //  TreeView
    $("#treeview").kendoTreeView({
//        checkChildren:true,
//        template: kendo.template($("#treeview-template").html()),
//
//        checkboxTemplate: kendo.template($("#treeview-checkbox-template").html()),

        dataSource:treedata
    });

});




