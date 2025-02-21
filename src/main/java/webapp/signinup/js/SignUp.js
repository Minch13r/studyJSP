function SignUp(action) {
    const form = document.getElementById('SignUpForm');
    if(action === 'signup') {
        const id = form.mid.value;
        const password = form.mpw.value;
        const email = form.email.value;
        const phoneNumber = form.phoneNumber.value;

        if(!id || !password || !email || !phoneNumber) {
            alert('필드를 모두 입력해주세요.');
            return;
        }
            form.submit();
    }
}
