console.log("kaaaak");

   document.querySelector(".cancel-btn").addEventListener('click', ()=> {
      cancel();
   });
   let status = document.querySelector(".status").textContent;
   const odno = document.querySelector('input[name="odno"]');

function cancel(){
     console.log(status);
	 console.log(mno);
	 console.log(mno.value);
	 console.log(odno);
	 if(confirm('정말 취소하시겠습니까? (입력된 정보는 저장되지 않습니다.)')){
		 if(mno.value === ''){
			 mno.value = 0;
		 }
		 location.href = '/refund/refund?mno='+mno.value+'&odno='+odno.value + '&status=' + status;
		 return;
	 }
}
