
/* Code : laurent -- koumbit.net */

if (isJsEnabled()) {
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
  var crntPos = parseInt(scrollPane.style.left)
  scrollPane.style.left = (crntPos  - 1) + "px";

  if(Math.abs(crntPos) >= scrollPane.scrollWidth){
    scrollPane.style.left = "0px";
  }
}

function pauseScroll() {
  clearInterval(document.scrollerIntervalID);
}

function reStartScroll() {
  var scrollIntervall = (document.getElementById("scrollerClipper").style.zIndex) * 10 ;
  document.scrollerIntervalID = window.setInterval("doScroll()", scrollIntervall);
}
