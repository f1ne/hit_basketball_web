/**
 * 
 */
    var xmlHttp;
	/*����XMLHttpRequest����*/
	function createXmlHttp(){
		xmlHttp=new XMLHttpRequest();
	}
	/*�����������Ӧ���*/
	function processResponse(){
		if (xmlHttp.readyState==4){
			if (xmlHttp.status==200){
			}
		}
	}
	/*���Ϳͻ��˵�����*/
	function sendRequest(url){
		createXmlHttp();
		xmlHttp.open("GET",url,true);
		xmlHttp.onreadystatechange=processResponse;
		xmlHttp.send(null);
	}
	/*���ӵ÷�*/
	function score(playerID,homeTeamID,awayTeamID){
	    //��ǰҳ��������Լ�1
	    var preScore=parseInt(document.getElementById(playerID+"score").innerText);
	    var url="Record.servlet?playerID="+playerID+"&event=score"+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    document.getElementById(playerID+"score").innerText=preScore+1;
	    sendRequest(url);
	    
	}
	/*���ӷ���*/
	function foul(playerID,homeTeamID,awayTeamID){
		//��ǰҳ��ķ��������Զ���1
		var prefoul=parseInt(document.getElementById(playerID+"foul").innerText);
	    document.getElementById(playerID+"foul").innerText=prefoul+1;
	    var url="Record.servlet?playerID="+playerID+"&event=foul"+"&homeTeamID="+homeTeamID+"&awayTeamID="+awayTeamID;
	    sendRequest(url);
	}