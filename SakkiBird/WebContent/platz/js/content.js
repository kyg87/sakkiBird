
//초기화값
var items = [
{id:0,value:20,text:"1번"},
  {id:1,value:30,text:"2번"},
  {id:2,value:50,text:"3번"}];


items.forEach(function(item){
 var progressBarWidth = item.value + "%" ;
$("#progress"+item.id)
    .children().animate({ width: progressBarWidth}, 100).text(item.value +"%");   
  $("#progress"+item.id +" span").text(item.text);
});