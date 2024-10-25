console.log("kaak");


const replyService = (function(){
	function add(reply,callback){
		fetch('/reply/new' , {
			method : 'post',
			body : JSON.stringify(reply),
			headers : {'content-type' : 'application/json; charset=utf-8'}
		})
		.then(response =>response.text())
		.then(data =>{
			callback(data);
		})
		.catch(err => console.log(err));
	}
	function getList(bno, callback){
		fetch('/reply/pages/' + bno + ".json")
		.then(response =>response.json())
		.then(data =>{
			callback(data);
		})
		.catch(err => console.log(err))
	}
	function remove(rno, callback){
		fetch('/reply/' + rno ,{
			method :'delete'
		})
		.then(response =>response.text())
		.then(data =>{
			callback(data);
		})
		.catch(err => console.log(err))
	}
	function update( rvo, callback){
		fetch('/reply/' + rvo.rno ,{
			method : 'put',
			body : JSON.stringify(rvo),
			headers : {'content-type' : 'application/json; charset=utf-8'}
		})
		.then(response =>response.text())
		.then(data =>{
			callback(data);
		})
		.catch(err => console.log(err))
	}
	function read(rno,callback){
		fetch('/reply/' + rno + ".json")
		.then(response =>response.json())
		.then(data =>{
			callback(data);
		})
		.catch(err => console.log(err))
	}
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		read : read
	};
})();
