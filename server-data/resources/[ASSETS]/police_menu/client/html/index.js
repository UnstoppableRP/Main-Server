$(function() {
  window.addEventListener('message', function(event) {
    if (event.data.type === "carmenuopen"){
              $("#backlol").hide();
              $("#buylol").hide();
              $('#log').show(100);
              $('#log2').show(100);
              $('#log3').show(100);
              $('#log4').show(100);
              $('#log5').show(100);
              $('#log6').show(100);
              $('#log7').show(100);
              $('#log8').show(100);

              $("#back2lol").hide();
              $("#buy2lol").hide();

              $("#back3lol").hide();
              $("#buy3lol").hide();

              $("#back4lol").hide();
              $("#buy4lol").hide();

              $("#back5lol").hide();
              $("#buy5lol").hide();

              $("#back6lol").hide();
              $("#buy6lol").hide();

              $("#back7lol").hide();
              $("#buy7lol").hide();

              $("#back8lol").hide();
              $("#buy8lol").hide();

    } else if(event.data.type === "balanceHUD") {
        $('.curbalance').html(event.data.balance);
    } else if (event.data.type === "closeAll"){
              $('#log, #log2, #log3, #log4, #log5, #log6, #log7, #log8, #backlol,').hide();
              $('body').removeClass("active");
    }
    else if (event.data.type === "result") {
      if (event.data.t == "success")
        $("#result").attr('class', 'alert-green');
      else
        $("#result").attr('class', 'alert-orange');
      $("#result").html(event.data.m).show().delay(5000).fadeOut();
    }
  });
});
  
$("#log").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#backlol').show(100);
  $("#buylol").show(100);
})

$("#log2").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back2lol').show(100);
  $("#buy2lol").show(100);
})

$("#log3").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back3lol').show(100);
  $("#buy3lol").show(100);
})

$("#log3").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back3lol').show(100);
  $("#buy3lol").show(100);
})


$("#log4").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back4lol').show(100);
  $("#buy4lol").show(100);
})



$("#log5").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back5lol').show(100);
  $("#buy5lol").show(100);
})


$("#log6").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back6lol').show(100);
  $("#buy6lol").show(100);
})


$("#log7").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back7lol').show(100);
  $("#buy7lol").show(100);
})



$("#log8").click(function(){
  $('#log').hide(100);
  $('#log2').hide(100);
  $('#log3').hide(100);
  $('#log4').hide(100);
  $('#log5').hide(100);
  $('#log6').hide(100);
  $('#log7').hide(100);
  $('#log8').hide(100);
  



  $('#back8lol').show(100);
  $("#buy8lol").show(100);
})

$("#backlol").click(function(){
  $("#buylol").hide(100);
  $("#backlol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buylol").click(function(){
  $("#buylol").hide();
  $("#backlol").hide();
  $.post('https://police_menu/policecar1', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})


$("#back2lol").click(function(){
  $("#buy2lol").hide(100);
  $("#back2lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy2lol").click(function(){
  $("#buy2lol").hide();
  $("#back2lol").hide();
  $.post('https://police_menu/policecar2', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})


$("#back3lol").click(function(){
  $("#buy3lol").hide(100);
  $("#back3lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy3lol").click(function(){
  $("#buy3lol").hide();
  $("#back3lol").hide();
  $.post('https://police_menu/policecar3', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})




$("#back4lol").click(function(){
  $("#buy4lol").hide(100);
  $("#back4lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy4lol").click(function(){
  $("#buy4lol").hide();
  $("#back4lol").hide();
  $.post('https://police_menu/policecar4', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})




$("#back5lol").click(function(){
  $("#buy5lol").hide(100);
  $("#back5lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy5lol").click(function(){
  $("#buy5lol").hide();
  $("#back5lol").hide();
  $.post('https://police_menu/policecar5', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})


$("#back6lol").click(function(){
  $("#buy6lol").hide(100);
  $("#back6lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy6lol").click(function(){
  $("#buy6lol").hide();
  $("#back6lol").hide();
  $.post('https://police_menu/policecar6', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})


$("#back7lol").click(function(){
  $("#buy7lol").hide(100);
  $("#back7lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy7lol").click(function(){
  $("#buy7lol").hide();
  $("#back7lol").hide();
  $.post('https://police_menu/policecar7', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})



$("#back8lol").click(function(){
  $("#buy8lol").hide(100);
  $("#back8lol").hide();
  $('#log').show(100);
  $('#log2').show(100);
  $('#log3').show(100);
  $('#log4').show(100);
  $('#log5').show(100);
  $('#log6').show(100);
  $('#log7').show(100);
  $('#log8').show(100);


})

$("#buy8lol").click(function(){
  $("#buy8lol").hide();
  $("#back8lol").hide();
  $.post('https://police_menu/policecar8', JSON.stringify({}));

  $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));


})

document.onkeyup = function(data){
      if (data.which == 27){
          $('#log, #log2, #log3, #log4, #log5, #log6, #log7, #log8, #backlol, #buylol, #back2lol, #buy2lol, #back3lol, #buy3lol, #back4lol, #buy4lol, #back5lol, #buy5lol, #back6lol, #buy6lol, #back7lol, #buy7lol, #back8lol, #buy8lol').hide();
          $.post('https://police_menu/NUIFocusOff', JSON.stringify({}));
      }
}