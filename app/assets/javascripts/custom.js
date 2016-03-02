/*

//Bu böyle çalışıyor sorun yok
$(document).ready(function(){


$("ul.dropdown-menu li a").click(function(){

	var sel=$(this).text();
	$(this).parents('.dropdown').find('.menuname').text(sel);



})
});

*/

function activate()
{
	console.log("in activate");
 	if ($("#uni_select").val()!=""  && $("#eposta").val()!="" )
	{
	console.log("atakan");
		$("#tus").removeClass("disabled");
	}

}

function dersekle()
{
	if(!$("#coursename").val())
	{
 		$("#tus").removeClass("disabled");

	}


}
