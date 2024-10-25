console.log('중고리스트페이지');

const img = document.querySelectorAll('.card-image');

img.forEach(i => {
	console.log(i.src);
});
function goShopInsert() {
//	console.log('중고상품 등록');
	location.href = '/used/goInsert';
}

function goGet(ubno){
	console.log("중고상품보기");
	location.href = `/used/goGet?ubno=${ubno}`;
}