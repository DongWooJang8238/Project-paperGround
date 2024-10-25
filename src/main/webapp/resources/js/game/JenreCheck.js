console.log("kaak");
document.addEventListener('DOMContentLoaded', function() {
    console.log("kaak");

    const form = document.getElementById('genreForm');
    // form이 제대로 가져왔는지 확인
    if (!form) {
        console.error("Form이 존재하지 않습니다.");
    } else {
        const gameModeInput = form.querySelector('input[name="gameMode"]');
        
        if (!gameModeInput) {
            console.error("gameMode input 필드를 찾을 수 없습니다.");
        } else {
            let gameMode = gameModeInput.value;
            console.log("장르체크");
            console.log(gameMode);

            let gameJenre;

            document.querySelectorAll(".panel-body-btns button").forEach(btn => {
                btn.addEventListener('click', () => {
                    let type = btn.getAttribute('id');

                    if (type === 'jenre1') {
                        gameJenre = "고전시가";
                        if (gameMode == 0) {
                            location.href = '/game/easyplay?gameMode=' + gameMode + '&gameJenre=' + gameJenre;
                        } else if (gameMode == 1) {
                            location.href = '/game/nomalplay?gameMode=' + gameMode + '&gameJenre=' + gameJenre + '&mno=' + 1;
                        }
                    }else if(type ==='jenre2'){
           			 gameJenre = "소설";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        			
        		}else if(type === 'jenre3'){
        			 gameJenre = "현대시가";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        				
        		}else if(type === 'jenre4'){
        			 gameJenre = "시조";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        				
        		}else if(type === 'jenre5'){
        			 gameJenre = "희곡";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        				
        		}else if(type === 'jenre6'){
        			 gameJenre = "역사소설";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        				
        		}else if(type === 'jenre7'){
        			 gameJenre = "한국시";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        				
        		}else if(type === 'jenre8'){
        			 gameJenre = "산문";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        				
        		}else if(type === 'jenre9'){
        			 gameJenre = "현대소설";
        			 if(gameMode == 0){
        					location.href = '/game/easyplay?gameMode='+gameMode+'&gameJenre='+gameJenre;
        				}else if(gameMode == 1){
        					location.href = '/game/nomalplay?gameMode='+gameMode+'&gameJenre='+gameJenre+'&mno='+1;
        				}
        		}
                });
            });
        }
    }
});
       