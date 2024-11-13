console.log('reportreply js');

const reportReplyService = (function() {
	
	function reportadd(reply, callback) {
		fetch('/reportreply/new' , {
			method : 'post',
			body : JSON.stringify(reply),
			headers : {'Content-type' : 'application/json; charset=utf-8'}
		})
			.then(response => response.text())	// 컨트롤러에서 전달받을 데이터가 'success' 라는 String 타입의 text 이기 때문에 text()라고 설정.
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
	}
	
	function reportgetList(reportBoardno, callback) {
		fetch('/reportreply/pages/' + reportBoardno + ".json")
			.then(response => {
				return response.json();
			})	// 컨트롤러에서 전달받을 데이터가 JSON 형태로 된 'list' 이기 때문에 json() 라고 설정.
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
	}
	
	function reportremove(replyno, callback) {
		fetch('/reportreply/' + replyno , {
			method : 'delete'
		})
			.then(response => response.text())
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
	}
	
	function reportupdate(reply, callback) {
		fetch('/reportreply/' + reply.replyno , {
			method : 'put',
			body : JSON.stringify(reply),
			headers : {'Content-type' : 'application/json; charset=utf-8'}
		})
			.then(response => response.text())
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
	}
	
	function reportget(replyno, callback) {
		fetch('/reportreply/' + replyno + ".json")
			.then(response => response.json())
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
		
	}
	
	return {
		reportadd : reportadd,
		reportgetList : reportgetList,
		reportremove : reportremove,
		reportupdate : reportupdate,
		reportget : reportget
	};
	
})();