// 페이지 로드 시 전화번호 입력 하이픈 추가
document.addEventListener('DOMContentLoaded', function() {
    // 전화번호 입력 필드 가져오기 - 이름 수정
    const phoneNumberField = document.querySelector('input[name="m_phone"]');

    if(phoneNumberField) { // null 체크 추가
        // 전화번호 입력 필드에 input 이벤트 리스너 추가
        phoneNumberField.addEventListener('input', function(e) {
            // 숫자만 추출
            const numbers = this.value.replace(/[^0-9]/g, '');

            // 추출된 숫자가 없으면 빈 값 설정
            if (numbers.length === 0) {
                this.value = '';
                return;
            }

            // 전화번호 형식에 맞게 하이픈 추가
            let formattedNumber = '';

            if (numbers.length <= 3) {
                formattedNumber = numbers;
            } else if (numbers.length <= 7) {
                formattedNumber = numbers.substring(0, 3) + '-' + numbers.substring(3);
            } else {
                formattedNumber = numbers.substring(0, 3) + '-' +
                    numbers.substring(3, 7) + '-' +
                    numbers.substring(7, 11);
            }

            // 최대 13자리로 제한
            this.value = formattedNumber.substring(0, 13);
        });
    }
});

function SignUp(action) {
    const form = document.getElementById('SignUpForm');

    if(action === 'signup') {
        // 필드 이름 수정
        const id = form.m_id.value;
        const password = form.m_pw.value;
        const name = form.m_name.value; // 이름 필드 추가
        const emailId = form.m_mail.value;
        const emailDomain = form.emailDomain.value;
        const phoneNumber = form.m_phone.value;

        if(!id || !password || !name || !emailId || !phoneNumber) {
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

        console.log(hiddenEmail);
        form.submit();
    }
}
