function submitsign(action) {
    const form = document.getElementById('loginForm');

    if (action === 'signup') {
        form.action = 'signup.jsp';
        form.submit();
        return;
    }

    // 로그인 처리
    if (action === 'login') {
        const mid = form.mid.value;
        const mpw = form.mpw.value;

        if (!mid) {
            alert('아이디를 입력해주세요.');
            return;
        }
        if (!mpw) {
            alert('비밀번호를 입력해주세요.');
            return;
        }

        form.action = 'loginprocess.jsp';
        form.submit();
    }
}
