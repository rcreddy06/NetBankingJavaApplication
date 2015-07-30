 document.write("<style>");
 document.write("td,legend {font-family:ms sans serif;color:gray;font-weight:bold;font-size:12px;text-transform:capitalize}");
 document.write("A:link,A:active,A:visited {color:lightslategray;font-family:tahoma;font-weight:bold;text-decoration:none;font-size:12px;}");
 document.write("A:hover {text-decoration:underline overline;color:maroon}");
 document.write("select {background:whitesmoke;font-size:12px}");
 document.write("li {padding:10px;list-style-type:square;font-size:12px;}");
 document.write("</style>");
 var apptit="::Online Net Banking::"; for(tit=0;tit<150;tit++) apptit+="&nbsp;&nbsp;";
 document.write("<TITLE>"+apptit+"</TITLE>");
 ud=true;
 function setColor() {
 var rgf=document.getElementById('register').rows;
 for(i=0;i<rgf.length;i++) {	ud=!ud;
 rbgcolor=ud?"linen":"mistyrose";
 rgf[i].style.backgroundColor=rbgcolor;
    }
 }

 function blockkey(tgt) {
 if(event.keyCode<48||event.keyCode>57)
 return false;
 else return true;
 }

 function trim(field){
 while(''+field.value.charAt(0)==' ') 
 field.value=field.value.substring(1);
 }

 function validate(frm){
 iput=document.all?document.all.tags("INPUT"):document.getElementsByTagName("INPUT");
 for(i=0;i<iput.length;i++) { 
             trim(iput[i]);
             if(iput[i].value=="") {
             (!document.all)?alert(iput[i].name.toUpperCase()+" value must be supplied"):vbwarn(iput[i].name.toUpperCase()+" value must be supplied");
             iput[i].focus();
             return false;} 
     } return true;
  }
	
 function checkPass(frm) {
 if(validate(frm)) {
        if(frm.confirm.value!=frm.pass.value) {
        (document.all)?vbwarn("Confirm Password Not matched with Original password"):alert("Confirm Password Not matched with Original password");
        frm.confirm.focus();
        return false;}
        else  return true;
    } else return false;
 }
function elementEffect() {
 var ipt=document.getElementsByTagName('INPUT'); 
 for(ip=0;ip<ipt.length;ip++) {
 ipt[ip].style.cssText="font-weight:bold;height:18px;background:whitesmoke;color:gray;border:1px solid gray;font-size:12px;-MOZ-BORDER-RADIUS:20PX;";
 ipt[ip].onfocus=function() { this.style["backgroundColor"]='papayawhip';}
 ipt[ip].onblur=function() { this.style["backgroundColor"]='whitesmoke';}
 } 
 var bt=document.getElementsByTagName('BUTTON'); 
 for(btn=0;btn<bt.length;btn++) {
 bt[btn].style.cssText="cursor:pointer;font-weight:bold;height:22px;background:lightslategray;color:aliceblue;width:120px";
 bt[btn].onmouseover=function() { this.style["backgroundColor"]='steelblue';this.blur()}
 bt[btn].onmouseout=function() { this.style["backgroundColor"]='lightslategray';}
 } 
 }