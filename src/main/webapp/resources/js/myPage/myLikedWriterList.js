let input = document.querySelector('#sub-search-bar');
let filterType = null;

console.log(input);
input.addEventListener('keyup', e => {
	filterType = input.value;
	console.log(filterType);
});

document.querySelector('#sub-search-icon').addEventListener('click', () => {
    document.querySelector('#sub-search-bar').focus();
});

document.querySelector('#sub-search-bar').addEventListener('keydown', function(event) {
    if (event.key === 'Enter') {
        searchFunction(); // 버튼 기능 실행
    }
});

function searchFunction() {
    if (filterType != null) {
    	let sendData = `userMno=${mno.value}&filterType=${filterType}`;
		location.href = '/User/myLikedWriterBookList?' + sendData;
    	console.log(1234);
    } else if (filterType === null) {
    	let sendData = `userMno=${mno.value}`;
		location.href = '/User/myLikedWriterBookList?' + sendData;
    }else{
    	alert("검색어를 입력하세요.");
    }
}

