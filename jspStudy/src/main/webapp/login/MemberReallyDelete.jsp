<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript">
        window.onload = function() {
            let flag = window.confirm("정말 탈퇴하시겠습니까?");
            console.log('flag', flag);  // 사용자의 응답을 콘솔에 출력
            if(flag === true) {
                let flag1 = window.confirm("참말루 진짜루 레알루 탈퇴하시겠습니까?");
                console.log('flag1', flag1);  // 두 번째 응답을 콘솔에 출력
                if(flag1 === true) {
                    window.location.href = 'memberDelete.jsp';
                } else {
                    window.location.href = 'loginServlet.jsp';
                }
            } else {
                window.location.href = 'loginServlet.jsp';
            }
        };
    </script>
</head>
<body>
</body>
</html>