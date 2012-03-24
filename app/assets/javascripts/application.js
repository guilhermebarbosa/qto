// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

$(function($) {
  $("#work_demolition_check").click(function() {
	if($("#work_demolition_check").is(":checked")){
		$(".div_demolition_check").css("display", "block")
	} else {
		$(".div_demolition_check").css("display", "none")
	}
  });

  $("#comment_document").click(function() {
	if($("#comment_document").is(":checked")){
		$(".div_document_check").css("display", "block")
	} else {
		$(".div_document_check").css("display", "none")
	}
  });

  $("#work_home_check").click(function() {
	if($("#work_home_check").is(":checked")){
		$(".div_home_check").css("display", "block")
	} else {
		$(".div_home_check").css("display", "none")
	}
  });

  $("#work_floor_check").click(function() {
	if($("#work_floor_check").is(":checked")){
		$(".div_floor_check").css("display", "block")
	} else {
		$(".div_floor_check").css("display", "none")
	}
  });

  $("#work_state_id").change(function() {
    // make a POST call && replace the content
    var state = $('select#work_state_id :selected').val();
    if(state == "") state = "0";
    jQuery.get('/works/update_city_select/' + state, function(data){
		$("#work_city_id").html(data);
    })
    return false;
  });

  $("#work_floor_qtd").change(function() {
	soma_pavimentos()
  });

  $("#work_floor_units").change(function() {
	soma_pavimentos()
  });

  $("#work_floor_bathroom").change(function() {
	soma_pavimentos()
  });

  $("#work_home_club").change(function() {
	soma_casa()
  });

  $("#work_home_ordinance").change(function() {
	soma_casa()
  });

  $("#work_home_support_ordinance").change(function() {
	soma_casa()
  });

});

function soma_pavimentos(){
	var qtd = parseInt($("#work_floor_qtd").val())
	var unidades = parseInt($("#work_floor_units").val())
	var bathroom = parseInt($("#work_floor_bathroom").val())
	
	if (qtd >= 0 && unidades >= 0 && bathroom >= 0){
		sum = eval(qtd * unidades * bathroom)
	} else {
		sum = "Preencha todos os campos"
	}
	
	$("#floor_qtd_total").html(sum)
}

function soma_casa(){
	var clube = parseInt($("#work_home_club").val())
	var portaria = parseInt($("#work_home_ordinance").val())
	var suporte_portaria = parseInt($("#work_home_support_ordinance").val())
	
	if (clube >= 0 && suporte_portaria >= 0 && portaria >= 0){
		sum = eval(clube + suporte_portaria + portaria)
	} else {
		sum = "Preencha todos os campos"
	}

	$("#home_qtd_total").html(sum)
}