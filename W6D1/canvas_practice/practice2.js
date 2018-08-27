document.addEventListener("DOMContentLoaded", function(){
  const cvs = document.getElementById('mycanvas');
  cvs.height = 500;
  cvs.width = 500;
  const ctx = cvs.getContext('2d')
  ctx.beginPath();
  ctx.arc(200, 200, 50, 0, Math.PI, true);
  ctx.moveTo(250, 250);
  ctx.arc(250, 250, 50, 90, Math.PI, true);
  ctx.bezierCurveTo(25, 25, 100, 100, 250,100)
  ctx.stroke();

});
