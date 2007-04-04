
/* Code : laurent -- koumbit.net */

if (isJsEnabled() && document.getElementById("scrollerClipper")!=null)
{
  addLoadEvent(startTicker);
} 

function startTicker(){
  initScrolling();
}

function initScrolling(){
  var scrollIntervall = (document.getElementById("scrollerClipper").style.zIndex) * 10 ;
  document.scrollerIntervalID = window.setInterval("doScroll()", scrollIntervall);
}

function doScroll(){
  var scrollPane = document.getElementById("scrollPane");
  var crntPos = parseInt(scrollPane.style.top)
  scrollPane.style.top = (crntPos  - 1) + "px";

  if(Math.abs(crntPos) >= scrollPane.scrollHeight){
    scrollPane.style.top = "0px";
  }
}

function pauseScroll() {
  clearInterval(document.scrollerIntervalID);
}

function reStartScroll() {
  var scrollIntervall = (document.getElementById("scrollerClipper").style.zIndex) * 10 ;
  document.scrollerIntervalID = window.setInterval("doScroll()", scrollIntervall);
}
