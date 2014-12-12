/**
 * 
 */
var xmlHttp;
var gamedate;
function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*处理响应*/
function processResponse(){
	if (xmlHttp.readyState==4){
		if (xmlHttp.status==200){
			var out="";
			var res=xmlHttp.responseXML;
				//刷新页面的球员数据
			var data=res.getElementsByTagName("PlayerData");
			var len=data.length;
			for (var i=0;i<data.length;i++){
    			var y=Array();
				var y=data[i].childNodes;
				var playerID=y[0].childNodes[0].nodeValue;
				var score=y[1].childNodes[0].nodeValue;
				var foul=y[2].childNodes[0].nodeValue;
				var teamID=y[3].childNodes[0].nodeValue;
				var state=y[4].childNodes[0].nodeValue;
				var name=y[5].childNodes[0].nodeValue;
				var teamName=y[6].childNodes[0].nodeValue;
				var teamLab=y[7].childNodes[0].nodeValue;
				var playerNumber=y[8].childNodes[0].nodeValue;
				var x=document.getElementById("playerdatatable").insertRow();
				var y0=x.insertCell(0);
				var y1=x.insertCell(1);
				var y2=x.insertCell(2);
				var y3=x.insertCell(3);
				var y4=x.insertCell(4);
				var y5=x.insertCell(5);
				var y6=x.insertCell(6);
				var y7=x.insertCell(7);
				var y8=x.insertCell(8);
				y0.innerHTML="<span style='color:white;'>"+name+"</span>";
				y1.innerHTML="<span style='color:white;'>"+playerID+"</span>";
				y2.innerHTML="<span style='color:white;'>"+teamID+"</span>";
				y3.innerHTML="<span style='color:white;'>"+teamName+"</span>";
				y4.innerHTML="<span style='color:white;'>"+teamLab+"</span>";
				y5.innerHTML="<span style='color:white;'>"+score+"</span>";
				y6.innerHTML="<span style='color:white;'>"+foul+"</span>";
				y7.innerHTML="<span style='color:white;'>"+gamedate+"</span>";
				y8.innerHTML="<span style='color:white;'>"+playerNumber+"</span>";
			}	
		}
		if (xmlHttp.status==500){
		    alert("查询的信息不存在，请检查球员姓名和日期");
		}
	}
}
	/*发送请求*/
function sendRequest(url){
	createXmlHttp();
	xmlHttp.open("POST",url,true);
	xmlHttp.onreadystatechange=processResponse;
	xmlHttp.send(null);
}
function searchPlayerData()
{
    var playerName=document.getElementById("PlayerName").value;
	var raceDate=document.getElementById("RaceDate").value;
	gamedate=raceDate;
	var url="SearchPlayerData.servlet?playerName="+playerName+"&raceDate="+raceDate;
	sendRequest(url);
}