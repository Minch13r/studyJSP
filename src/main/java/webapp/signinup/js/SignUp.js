function SignUp(action) {
    const form = document.getElementById('SignUpForm');
    if(action === 'signup') {
        const id = form.mid.value;
        const password = form.mpw.value;
        const emailId = form.emailId.value;
        const emailDomain = form.emailDomain.value;
        const phoneNumber = form.phoneNumber.value;

        if(!id || !password || !emailId || !phoneNumber) {
            alert('필드를 모두 입력해주세요.');
            return;
        }

        // 이메일 형식 검사
        const emailRegex = /^[a-zA-Z0-9_-]+$/;
        if (!emailRegex.test(emailId)) {
            alert('올바른 이메일 형식이 아닙니다.');
            return;
        }

        // 전화번호 형식 검사
        const phoneRegex = /^010-\d{4}-\d{4}$/;
        if (!phoneRegex.test(phoneNumber)) {
            alert('올바른 전화번호 형식이 아닙니다.');
            return;
        }

        // 이메일 전체 값을 하나의 필드로 합치기
        const fullEmail = emailId + '@' + emailDomain;

        // 숨겨진 입력 필드 생성하여 전체 이메일 값 전송
        const hiddenEmail = document.createElement('input');
        hiddenEmail.type = 'hidden';
        hiddenEmail.name = 'email';
        hiddenEmail.value = fullEmail;
        form.appendChild(hiddenEmail);

        form.submit();
    }
}