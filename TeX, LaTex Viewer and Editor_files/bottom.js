function init_cookieconsent(){
var gdomain=(document.domain || '').toLowerCase();
function setCookie(name, value, expires) { 
  if (!expires) expires=1000*60*60*24*365*7;
  path="/";
  domain=gdomain;
  secure=false;
  var today = new Date(); 
  today.setTime( today.getTime() ); 
  var expires_date = new Date( today.getTime() + (expires) ); 
  document.cookie = name + "=" +escape( value ) + 
          ( ( expires ) ? ";expires=" + expires_date.toGMTString() : "" ) + //expires.toGMTString() 
          ( ( path ) ? ";path=" + path : "" ) + 
          ( ( domain ) ? ";domain=" + domain : "" ) + 
          ( ( secure ) ? ";secure" : "" ); 
} 

function getCookie( name ) {
  var nameOfCookie = name + "=";
  var x = 0;
  while ( x <= document.cookie.length ) {
    var y = (x+nameOfCookie.length);
    if ( document.cookie.substring( x, y ) == nameOfCookie ) {
      if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
         endOfCookie = document.cookie.length;
      return unescape( document.cookie.substring( y, endOfCookie ) );
    }
    x = document.cookie.indexOf( " ", x ) + 1;
    if ( x == 0 ) break;
  }
  return "";
}
	if(gdomain.indexOf("herokuapp.com")<0){
		var arr=gdomain.split(".");
		if(arr.length==3 && (arr[arr.length-1]=='com' || arr[arr.length-1]=='net')){
			arr.splice(0,1);
			gdomain="."+arr.join(".");
			//alert(gdomain);
		}
	}
	if(getCookie('cc_gotit')=='1')return;
	if(!document || !document.body)return;

	var div=document.createElement("DIV");
	div.setAttribute("style", "z-index:90000000; position: fixed; bottom: 0; right: 0; background-color:white; margin:10px 15px 10px 10px; padding:8px; font-size:15px;-webkit-box-shadow: 0 0 10px #999;-moz-box-shadow: 0 0 10px #999;box-shadow: 0 0 10px #999;");
	div.innerHTML='<table><tr><td style="font-size:15px">This website uses cookies to ensure you get the best experience on our website.<tr><td style="font-size:15px"><button style="padding:2px 40px;font-size:14px" id="cc_gotit">Got It!</button> &nbsp;<a href="" id="cc_learnmore" style="font-size:15px">Learn more</a></table>';
	document.body.appendChild(div);		

	var ifrm=document.createElement("IFRAME");
	ifrm.setAttribute("style", "z-index:80000000; position: fixed; bottom: 0; right: 0; background-color:white; margin:10px 15px 10px 10px;");
	ifrm.setAttribute("frameborder","0");
	ifrm.style.width=div.offsetWidth+'px';
	ifrm.style.height=div.offsetHeight+'px';
	document.body.appendChild(ifrm);		

	var cc_gotit=document.getElementById('cc_gotit');
	if(cc_gotit){
		cc_gotit.onclick=function(){
			div.style.display='none';
			ifrm.style.display='none';
			setCookie('cc_gotit','1');
		}
	}
	var tos='';
	var a = document.getElementsByTagName('script');
	for(var i = 0, l = a.length; i < l; i++){
		if(a[i].src && a[i].src.indexOf("bottom.js")>=0 && a[i].getAttribute('tos')){
			tos=a[i].getAttribute('tos');
			if(!a[i].getAttribute('sitetitle')){
				tos+=encodeURIComponent(document.title);
			}
			break;
		}
	}
	var cc_learnmore=document.getElementById('cc_learnmore');
	if(cc_learnmore){
		cc_learnmore.href=tos;
		cc_learnmore.target="_blank";
	}
}
init_cookieconsent();
