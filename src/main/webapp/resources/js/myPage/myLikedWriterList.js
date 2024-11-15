let input = document.getElementById('search-input');
let filterType = null;

console.log(input);
input.addEventListener('keyup', e => {
	filterType = input.value;
	console.log(filterType);
	
	
});

console.log("dd" + mno.value);
function test() {
	console.log(filterType);
	
	if(filterType != null){
		let sendData = `userMno=${mno.value}&filterType=${filterType}`;
		location.href = '/User/myLikedWriterBookList?' + sendData;
	}else if(filterType === null){
		let sendData = `userMno=${mno.value}`;
		location.href = '/User/myLikedWriterBookList?' + sendData;
	}
	
		
}