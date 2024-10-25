    function toggleDetails() {
      console.log(1);
        // 모든 order-details 행을 선택하여 display를 토글
        var detailRows = document.querySelectorAll('.order-details');
        detailRows.forEach(function(row) {
            if (row.style.display === "none") {
                row.style.display = "table-row"; // 보이게
            } else {
                row.style.display = "none"; // 숨기기
            }
        });
    }
    
