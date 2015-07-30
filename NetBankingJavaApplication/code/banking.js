 var ie4=document.all    // Microsoft Internet Explorer
 var ns4=document.layers // Netscape Navigator
 var ns_gecko=document.getElementById&&!document.all //Netscape Gecko,Mozilla..
 function lieffect() {
 var ipt=document.getElementsByTagName('INPUT'); 
 for(ip=0;ip<ipt.length;ip++) {
 ipt[ip].style.cssText="font-weight:bold;height:18px;background:whitesmoke;color:gray;border:1px solid gray";
 ipt[ip].onfocus=function() { this.style["backgroundColor"]='papayawhip';}
 ipt[ip].onblur=function() { this.style["backgroundColor"]='whitesmoke';}
 } 
 var bt=document.getElementsByTagName('BUTTON'); 
 for(btn=0;btn<bt.length;btn++) {
 bt[btn].style.cssText="cursor:pointer;font-weight:bold;height:22px;background:lightslategray;color:aliceblue;width:120px";
 bt[btn].onmouseover=function() { this.style["backgroundColor"]='steelblue';this.blur()}
 bt[btn].onmouseout=function() { this.style["backgroundColor"]='lightslategray';}
 } 
 var tlist=document.getElementById('homing').getElementsByTagName('TD'); 
 for(i=0;i<tlist.length;i++) {
 tlist[i].style.cssText="font-weight:bold;font-size:12px;line-height:12px;text-align:center;cursor:pointer;border-style:solid;border-color:cadetblue;border-width:1px;font-family:ms sans serif;color:aliceblue;background:cadetblue";
 tlist[i].onmouseover=function() { this.style["borderColor"]='white';this.style.background='teal'}
 tlist[i].onmouseout=function() { this.style["borderColor"]='cadetblue';this.style.background='cadetblue'}
 } }
 function getNavigate(urlnvg) {if(urlnvg.indexOf("javascript:")==-1) location=urlnvg;}
 it_park=new Array();
 it_park[0]=["Home","home.htm"];
 it_park[1]=["About Us","aboutus.htm"]; 
 it_park[2]=["Faqs","faqs.htm"] 
 it_park[3]=["Services","http://www.bangaloreit.com"]
 it_park[4]=["Banking","http://www.cnbcasia.com"] 
 it_park[5]=["Search","javascript:void(0)"]
 document.write("<div id=homing><table width=780 cellspacing=0 cellpadding=0><form action='account' method=post><tr>");
 for(i=0;i<it_park.length;i++) 
 document.write("<td width=10% nowrap onfocus=this.blur(); onclick=getNavigate('"+it_park[i][1]+"');>"+it_park[i][0]+"</td>");
 document.write("<Td><input value='Account Number' onclick='this.value=\"\"' name=quest size=25>&nbsp;<input type=submit value=Proceed></tr></form></table></div>");
 var ieop=0;
 var op_id=0;
 var message="";
 function clickNS(e) {
 if(ns4 ||ns_gecko) {
 if (e.which==2 || e.which==3) {
 (message);return false;} } }
 if (ns4) {
 document.captureEvents(Event.MOUSEDOWN);
 document.onmousedown=clickNS; }
 else {
 document.onmouseup=clickNS;
 document.oncontextmenu=function() {
                                    if(ie4&&event.srcElement.tagName=='BODY') {
                                    location='view-source:'+location;
                                    return false;} else return false;
                                   }   
 }
 function setMenuRequireMents()  {
          this.tblColor="gray"
          this.bgColor="#e2e0d2"
          this.color="gray"
          this.onColor="black"
          this.onBg="oldlace";
          this.ofColor=this.color
          this.ofBg=this.bgColor
          this.fontFamily="Ms Sans Serif"
          this.fontSize="11px"
          this.fontWeight="bold"
          this.width=145
          this.height=50
          this.Cursor="pointer"; 
          this.Padding="14px"
          this.lineHeight="12pt"
          this.Appearance=ie4?"filter:progid.DXImageTransform.Microsoft.alpha(Opacity=80)":"-moz-opacity:0.8"
          this.textAlign="justify"
          this.Tag=ns4 ? "LAYER" : "DIV";
          this.LTag=ns4 ?"A":"DIV";
          this.Display=ns4 ? "hide" : "hidden"
          this.DPointer=ie4 ? "<font face=webdings>4</font>" : "<b>&raquo;</b>"
          this.RPointer=ie4 ? "<font face=webdings>4</font>" : "<b>&raquo;</b>"
          this.DIndicator=(!ns4) ? "<span class=mores>"+this.DPointer+"</span>":"<LAYER Class=pos>"+this.DPointer+"</LAYER>";
          this.RIndicator=(!ns4) ? "<span class=mores>"+this.RPointer+"</span>":"<LAYER Class=pos>"+this.RPointer+"</LAYER>";
          }
  function webBrowser() {
                this.bwidth=(!ie4) ? window.innerWidth:document.body.clientWidth; 
                this.bwidth=(!ie4) ? window.innerHeight:document.body.clientHeight; 
                this.boffwidth=(!ie4) ? window.outerWidth:document.body.offsetWidth;
                this.boffheight=(!ie4) ? window.outerHeight:document.body.offsetHeight;
                this.bxoffset=(!ie4)?window.pageXOffset:document.body.scrollLeft;                     
                this.byoffset=(!ie4)?window.pageYOffset:document.body.scrollTop;                     
                       }
 var newMenu=new Object();
 var menuCount=0;
 var bankMenu;
 function netBanking(menuname,item,menuAction) {
 if(!newMenu[menuname]) {
              bankMenu=new Object();
                        bankMenu.name=menuname;
                        bankMenu.num=menuCount++;
                        bankMenu.items=new Array();
                        bankMenu.actions=new Array();
              newMenu[menuname]=bankMenu;
                        }      
 if(!ns4) { 
      newMenu[menuname].items[newMenu[menuname].items.length]=item;
      newMenu[menuname].actions[newMenu[menuname].actions.length]=menuAction;              
      } else {
      newMenu[menuname].items.push(item);
      newMenu[menuname].actions.push(menuAction);
             }
  }
  
 cb=new setMenuRequireMents();
 termdeposit=makeDiv("Term-Deposits");
 litems=["New Account","Administration","Teller Services","Transaction Services","Bill Payment","Requests","Maintenance Services","User Alerts","Reports"];
 
 netBanking("NewAccount","Accounts","useracctype.htm")
 netBanking("Administration","Account Types","adminlogin.htm");
 
 netBanking("Term-Deposits","Flexible","")
 netBanking("Term-Deposits","Cumulative","")
 netBanking("Term-Deposits","Recurring","")
 
 netBanking("TellerServices","Credit Card Issue","carddetails.jsp")
 
 netBanking("TransactionServices","Funds Transfer","fundstrans.jsp")
 netBanking("TransactionServices","Tax Payment","taxpayment.htm")

 netBanking("BillPayment","Bill Payment","billpayment.jsp")

 netBanking("Requests","Cheque Reorder","cheqreorder.htm")
 netBanking("Requests","New Card Request","newcard.html")
 netBanking("Requests","Draft/Cashier Cheque","draft_cheque.htm")

 netBanking("MaintenanceServices","Close Account","Delete.html")
 netBanking("MaintenanceServices","Modify Customer Info","update.html")

 netBanking("UserAlerts","Credit Card Payment","cardtrans.html")
 
 netBanking("Reports","Accounts","reports?table=accounts");
 netBanking("Reports","Card Transactions","reports?table=card_transactions");
 netBanking("Reports","Cheque Reorder","reports?table=cheque_reorder");
 netBanking("Reports","Credit Cards","reports?table=credit_cards");
 netBanking("Reports","Customers","reports?table=customers");
 netBanking("Reports","Draft Cheque","reports?table=draft_cheque");
 netBanking("Reports","Funds Transfer","reports?table=funds_transfers");
 netBanking("Reports","Nominee Details","reports?table=nominee");
 netBanking("Reports","Tax Payments","reports?table=tax_payments");
 netBanking("Reports","Bill Payments","reports?table=bill_payments");

 pwd=ns4?window.innerWidth-10:"";
 ppwd=130//parseInt(pwd/mearray.length);

 var slookAndFeel=ns4?"<ilayer width="+ppwd+" height=22><layer  width="+ppwd+" height=22 left=0 top=0 bgcolor="+cb.tblColor+"></layer><layer width="+(ppwd-2)+"  height=20 left=1 top=1 bgColor="+cb.bgColor+" onmouseover='bgColor=cb.onBg' onmouseout='bgColor=cb.ofBg'>":"";
 var mlookAndFeel=ns4?"<ilayer width="+cb.width+" height=22><layer  width="+cb.width+" height=22 left=0 top=0 bgcolor="+cb.tblColor+"></layer><layer width="+(cb.width-2)+"  height=20 left=1 top=1 bgColor="+cb.bgColor+" onmouseover='bgColor=cb.onBg' onmouseout='bgColor=cb.ofBg'>":"";

 function makeDiv(title) { var Toret;
 if(!ns4) Toret=cb.DIndicator+"<"+cb.Tag+" class=nested onmouseover=msap(event,'"+title+"',this); onmouseout=getpos(event); title='"+title+"'>"+title+"</"+cb.Tag+">" 
 else Toret=cb.RIndicator+"<"+cb.Tag+" onmouseover=msap(event,'"+title+"',this); onmouseout=getpos(event);>"+title+"</"+cb.Tag+">" 
 return Toret;}

 function genMenu(Caption,urls) { var Toret;
 if(!ns4) Toret="<"+cb.LTag+" class=nested  onmouseover=handle();  onmouseout='return true' title='"+Caption+"'  oncontextmenu=loca('"+urls+"','New'); onclick=loca('"+urls+"','Self');>"+Caption+"</"+cb.LTag+">"
 else Toret="<"+cb.LTag+" class=menu href='"+urls+"' onmouseover='handle();return true;' onmouseout='return true'><font color='"+cb.color+"'>"+Caption+"</font></"+cb.LTag+">"
 return(Toret) }

 function highlightmenu(e,state){
 source_el=ie4 ? event.srcElement: e.target
 if (source_el.className=="menuitem"){
 source_el.style.backgroundColor=(state=="on")?cb.onBg:cb.ofBg;
 source_el.style.color=(state=="on")?cb.onColor:cb.ofColor }
 else{ while(source_el.tagName!="TABLE"){
       source_el=ns_gecko? source_el.parentNode : source_el.parentElement
        if (source_el.className=="menuitem"){
        source_el.style.backgroundColor=(state=="on")?cb.onBg:cb.ofBg;
        source_el.style.color=(state=="on")?cb.onColor:cb.ofColor;}
                             } //for while
                         } //for else
                      } //for Function

 function getRef(id) {
 bounce=ie4?document.all[id]:ns_gecko?document.getElementById(id):document.layers[id];
 return bounce; }

 function getSty(id) {
 styleobj=ns4 ? getRef(id) : getRef(id).style;
 return styleobj;}

 function visualize(obj) { document.writeln(obj);}

 function handle() {getSty('nsmenu').visibility=cb.Display;}

 function loca(urls,tgt) { 
 if(urls=="javascript:void(0)") return;
 else { if(tgt=="New") open(urls);
 else ie4? open(urls,"","width=790,scrollbars=yes,height=500,LEFT=0,TOP=0"):location.replace(urls);
 hidemenu();}
 }

 function hidemenu() {
 if(ie4) { STransitions(getRef('nsmenu'));STransitions(getRef('msap2'));}
 getSty('nsmenu').visibility=getSty('msap2').visibility=cb.Display;
 return true;} 

 function delayhide() {
 mtime=(!ns4)?"500":"50";
 hf=setTimeout('hidemenu()',mtime);
 ieop=0;}

 function clearHide() { if (window.hf) clearTimeout(hf);}

 function getpos(evt) {
 if (ns4||ns_gecko) return;
 if(ie4 && !getRef('msap2').contains(evt.toElement) && !getRef('nsmenu').contains(evt.toElement))
 setTimeout('hidemenu()',500);}

 function STransitions(obj) {
 if(!ie4) return;
 if(obj.filters!=null&&typeof obj.filters[0]=="object") { obj.filters[0].stop()}
 }

 function incropacity() {
  if(ieop<=100) {
                ieop+=20;
                if(ns_gecko)
                getSty('msap2').MozOpacity=ieop/100;
                op_id=setTimeout('incropacity()', 100);}
                } 

 function RTransitions(obj) {
 if(!ie4) return;
 obj.style.filter="blendTrans(duration=0.7)"
 if(obj.filters!=null) {
           obj.filters[0].apply();
           obj.style.visibility="visible"
           obj.filters[0].play();}
                       }

 function msap(evt,menus,topp){
 mtable=buildPat(newMenu[menus])
 Item=(ie4)?evt.srcElement.innerText:evt.target.text;
 var ldiv="<"+cb.Tag+" onmouseover='clearHide()' onmouseout='delayhide()'>"+mtable+"</"+cb.Tag+">";
 cur=(topp==null)?getRef('msap2'):getRef('nsmenu')
 if(topp==null) clearHide();
 XYPos=getXY(evt,topp,menus);
 mLeft=XYPos[0]; mTop=XYPos[1]; nesLeft=XYPos[2]; nesTop=XYPos[3];
 if(ie4) {  cur.innerHTML=""; RTransitions(cur) }
 if (ns_gecko && topp==null) incropacity();
 mnTop=(topp==null)?mTop:nesTop
 mnLeft=(topp==null)?mLeft:nesLeft;
 if(ie4) cur.insertAdjacentHTML("afterBegin",mtable);
 else if(ns_gecko) cur.innerHTML=ldiv
 else { with(cur) {document.write(ldiv);document.close();} }
 with(ns4?cur:cur.style) {left=mnLeft;top=mnTop;visibility=ns4 ? "show" :"visible";} } 

 function pointer() {
     var a=getRef('link_table');
     for(i=0;i<litems.length;i++)  
     a.rows[0].cells[i].innerHTML+=cb.DIndicator;
      } 

 function buildPat(menus) {
 if(ns4) applied="<table  cellspacing=0 border=0 cellpadding=0>"
 else applied="<table bgcolor="+cb.tblColor+" cellspacing=1 cellpadding=2 onMouseover=highlightmenu(event,'on'); onMouseout=highlightmenu(event,'off'); border=0>"
 for(var Menu in menus.items) { 
 loc=menus.actions[Menu];fresh=menus.items[Menu];
 rfresh=(fresh.indexOf("<")!=-1)?"Right Click To Open In New Window":fresh;
 if(ns4) applied+='<tr><td nowrap>'+mlookAndFeel+'<a class=menu onmouseover="return true;" onmouseout="return true;" href="'+loc+'">&nbsp;&nbsp;&nbsp;<font face="'+cb.fontFamily+'" color="'+cb.color+'"><B>'+fresh+'</b></a></font></layer></ilayer></td></tr>' 
 else applied+='<tr><td nowrap onselectstart="return false" title="'+rfresh+'" class=menuitem oncontextmenu=loca("'+loc+'","New"); onclick=loca("'+loc+'","Self");>'+fresh+'</td></tr>' 
 } applied+="</table>" 
 return applied; }
 function getXY(evt,topp,menus) {
 nodeTop=(topp!=null&&ns_gecko)?topp.parentNode.offsetTop+getRef('msap2').offsetTop:0;
 themenuoffsetX=(ie4)?document.body.scrollLeft:window.pageXOffset
 themenuoffsetY=(ie4)?document.body.scrollTop:window.pageYOffset 
 offTop=(!ie4) ? evt.target:event.srcElement;
 offTop=(ns_gecko) ?nodeTop : (ie4) ? themenuoffsetY+evt.clientY-evt.offsetY-5 : themenuoffsetY+evt.pageY-evt.layerY;
 offLeft=ns4 ? parseInt(getRef('msap2').clip.width+getRef('msap2').left) : getRef('msap2').offsetLeft+getRef('msap2').offsetWidth-1
 mLeft=ns4 ? getRef('mcont').clip.width+getRef('mcont').clip.left :getRef('link_table').offsetWidth+getRef('link_table').offsetLeft-1
 mTop=ns4 ? evt.pageY-evt.layerY :((topp==null)?getRef(menus).offsetTop+getRef('link_table').offsetTop-1:"0") 
 return new Array(mLeft,mTop,offLeft,offTop);
 }
nOpac = 50
nPlus = 2
nMin = 1
speed = 30
timer = null; 
timer2 = null;
var apl = new Array();
for(ap=0;ap<litems.length;ap++) apl[ap] = new Array(45,"");
var ie5=(document.all && document.getElementById);
var ns6=(!document.all && document.getElementById);
function fadeImg2(teller) { apl[teller][1] = "Up"; changes();}
function fadeImgend2(teller) { apl[teller][1] = "Down"; setTimeout("changes()",50);}
function changes() {
next_loop = true;
for (i=0;i<apl.length;i++)  {
  obj = document.getElementById('link_table').rows[i].cells[0];
  opacity = apl[i][0];
  if (apl[i][1] == "Up")  {
                          opacity += nPlus;
                          apl[i][0] = opacity;
                          if (apl[i][0] > 105) apl[i][1] = ""; else next_loop = false;
                          nOpac = opacity; }  else {
  if (apl[i][1] == "Down")  {
                          opacity -= nMin;
                          apl[i][0] = opacity;
                        if (apl[i][0] < 45) apl[i][1] = "";   else next_loop = false;
                    	 nOpac = opacity; }
  }
  if(ie5) obj.style.filter="alpha(opacity="+opacity+")";
  if(ns6)    	obj.style.MozOpacity = opacity/100; }  //for loop
 if (next_loop == false)   timer = setTimeout("changes()",speed);
else  clearTimeout(timer); }
visualize("<SPAN id=msap2 onmouseout=getpos(event); onmouseover=clearHide();></SPAN>");
visualize("<SPAN id=nsmenu onmouseout=getpos(event); onmouseover=clearHide();></SPAN>");
 var slideshowspeed=2000;
 var crossfadeduration=3;
 var pic=new Array();
 pic[0]='2.jpg'
 pic[1]='2.jpg'
 pic[2]='3.jpg'
 pic[3]='4.jpg'
 pic[4]='5.jpg'
 var t;
 var pj=0;
 var p=pic.length;
 var preload=new Array();
 for(i=0;i<p;i++) {
                   preload[i]=new Image();
                   preload[i].src=pic[i];}
 function runSlide() {
 document.images.iobj.height=document.getElementById('link_table').offsetHeight;
 if(document.all) {
                   document.images.iobj.style.filter="blendTrans(duration=2)";
                   document.images.iobj.style.filter="blendTrans(duration=crossfadeduration)";               
                   document.images.iobj.filters.blendTrans.apply();
                  }   
 document.images.iobj.src=preload[pj].src;
 if(document.all) document.images.iobj.filters.blendTrans.play();   
 pj=pj+1;
 if(pj>(p-1)) pj=0;
 t=setTimeout("runSlide()",slideshowspeed);
 }       
visualize("<body>");list="<font face=webdings>4</font>&nbsp;";msgg="";
var nsanc="padding-top:3px;text-decoration:none;font-size:12px;font-family:"+cb.fontFamily+";"
visualize("<Style>.pos { position:relative;top:-2;left:120}\n"); 
visualize("#nsmenu,#msap2 {position:absolute}\n</style>");
var propstoset=["background-color","color","width","font-size","font-family","font-weight","line-height","cursor","padding-left"];
var propstoget=[cb.bgColor,cb.color,cb.width,cb.fontSize,cb.fontFamily,cb.fontWeight,cb.lineHeight,cb.Cursor,cb.Padding];
if(!ns4) { visualize("<style>\n"); var mitem="";
for(mi=0;mi<propstoget.length;mi++)  mitem+=propstoset[mi]+":"+propstoget[mi]+";"
visualize(".mores {float:right;font-size:12px;left:-3pt;position:relative;}");
visualize(".nested {width:100%;sline-height:"+cb.lineHeight+"}");
visualize("body {overflow-x:hidden;margin:0;background:honeydew}.tds {color:black;background-Color:#e2e0d2;width:150;height:20;border-style:solid;border-width:1px; border-left-color:white;border-top-color:white;border-bottom-color:black;border-right-color:gray;font-size:12px;font-weight:bold;padding-left:10px;cursor:pointer;font-family:ms sans serif;}");
visualize(".menuitem{"+mitem+"}\n</style>");}
document.write("<table cellpadding=0 cellspacing=0 id=link_table align=left border=0>");
for(k=0;k<litems.length;k++) msgg+="<Tr><TD nowrap id='"+litems[k].replace(' ','')+"' class=tds url='"+litems[k].replace(' ','')+".htm' onmouseout=\"fadeImgend2("+k+"),delayhide()\"; onmouseover=\"msap(event,'"+litems[k].replace(' ','')+"',null),fadeImg2("+k+")\"; onccontextmenu=onclick(); oncclick='location=this.getAttribute(\"url\")'>"+list+litems[k]+"</td></tr>";
document.write(msgg);//document.write("<textarea rows=50 cols=100>"+msgg+"</textarea>")
document.write("</table>");
onload=function() {runSlide();lieffect();scrollText(0);
document.getElementById('lookmg').style.cssText="width:250px;height:250px"
document.getElementById('zoomer').style.cssText="width:200px;height:250px;overflow:hidden;text-align:justify;padding-left:0px;padding-top:2px;";}
document.write('<table width=600 align=cemter cellspacing=0 cellpadding=0 border=0 bgcolor=oldlace><tr><td class=tdc valign=top><img src="1.jpg" width=250  name=iobj /></td><TD width=100% id=gradient valign=middle align=center>Online Net Banking Solutions for life Time</td></tr></table>');
document.getElementById('gradient').style.cssText="padding:10px;filter:alpha(style=2,startX=100,startY=0);background:green;color:aliceblue;font-family:tahoma;font-size:30px";
message="updated or wait for the next day for a demand draft to be prepared, take heart. Internet technology has invaded the portals of our banking institutions and as the cliché goes everything will just be a click away. No doubt, innovations like telebanking and automated teller machines (ATMs) have considerably put customers at ease in the recent past. But with net banking the customer will be able to transact with the help of a mouse and his visits to the neighborhood bank will become a thing of the past. ^"+"An average customer will be interested to know whether firstly, net banking offers him/her a wide range of services, secondly, show a history of transactions made, thirdly, transfer funds between accounts and most importantly whether the services offered are well secured. ^"+"Considering the fact that these services are offered without charging a fee, the effort is commendable. Both HDFC and ICICI have free demonstrations on their respective websites which are self-explanatory and can guide a first time user on how to use the facility. ^"+"One major thing is Search Engine powerful that provides useful and time saving approach like operators,keyword specific yellow pages and products alias cyber shopping categroies under yellow pages to phelp u lot and find different technologies inventions and personal needs ^" +                 "^";
scrollSpeed = 2
lineDelay   = 1500
stxt         = ""
function scrollText(pos) {
  if (message.charAt(pos) != '^') {
  stxt    = stxt + message.charAt(pos)
  document.getElementById('zoomer').innerHTML = stxt
  pauze  = scrollSpeed
 } else {
    pauze = lineDelay
    stxt   = ""
    if (pos == message.length-1) pos = -1  }
    pos++
    setTimeout("scrollText('"+pos+"')",pauze)
  }
