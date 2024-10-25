console.log('reply js');

const replyService = (function() {
	
	function add(reply, callback) {
		fetch('/reply/new' , {
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
	
	function getList(boardno, callback) {
		fetch('/reply/pages/' + boardno + ".json")
			.then(response => {
				return response.json();
			})	// 컨트롤러에서 전달받을 데이터가 JSON 형태로 된 'list' 이기 때문에 json() 라고 설정.
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
	}
	
	function remove(replyno, callback) {
		fetch('/reply/' + replyno , {
			method : 'delete'
		})
			.then(response => response.text())
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
	}
	
	function update(reply, callback) {
		fetch('/reply/' + reply.replyno , {
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
	
	function get(replyno, callback) {
		fetch('/reply/' + replyno + ".json")
			.then(response => response.json())
			.then(data => {
				callback(data);
			})
			.catch(err => console.log(err));
		
	}
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get
	};
	
})();