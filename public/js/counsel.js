$(document).ready(function() {

		// create DatePicker from input HTML element
		$("#win").hide();
		$("button.create").click(function () {
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
		});
		
		$(".start-date").kendoDatePicker();
		$(".end-date").kendoDatePicker();
		$(".start-time").kendoTimePicker();
		$(".end-time").kendoTimePicker();;
		$("#date").kendoDatePicker();
		
		var grid = $("#counsel-show").kendoGrid({
	        dataSource: {
	            pageSize: 10
	        },
	        groupable: true,
	        scrollable: true,
	        sortable: true,
	        pageable: true
	    });
		
		
		$("#btn-del").click(function(){
			var id = $(this).attr("counsel_id");
			alert(id);
			var url = "deleteCounsel";
			$.get(url,
					{
		               id:id
		            },function(data) {
		            	window.location = window.location.href;
		            });
		});
		
		$("#horizontal").kendoSplitter({
			orientation: "horizontal",
            panes: [
                { collapsible: false, resizable: true, size:"1000px"},
                { collapsible: false, resizable: true}
            ]
        });
});
