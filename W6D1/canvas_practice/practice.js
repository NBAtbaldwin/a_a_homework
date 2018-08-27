document.addEventListener("DOMContentLoaded", function(){
  const cvs = document.getElementById('mycanvas');
  cvs.height = 500;
  cvs.width = 500;
  const ctx = cvs.getContext('2d')
  ctx.fillstyle = "red";
  ctx.fillRect(0,0,500,500);
  ctx.beginPath();
  ctx.arc(200,200,50,0,2*Math.PI);
  ctx.strokeStyle = "yellow";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'orange';
  ctx.fill();
});
