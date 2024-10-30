console.log('중고리스트페이지');

const img = document.querySelectorAll('.card-image');

img.forEach(i => {
	console.log(i.src);
});
function goShopInsert() {
//	console.log('중고상품 등록');
	if(mno.value === ""){
		alert('로그인이 필요한 기능입니다!');
		return;
	}else{
		location.href = '/used/goInsert';
	}
}

function goGet(ubno){
	console.log("중고상품보기");
	location.href = `/used/goGet?ubno=${ubno}`;
}