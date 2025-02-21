package calc;

// Bean = 로직을 담은 상자
public class CalcBean {
    private int res;

    public CalcBean(int num1, int num2, String op) {
        System.out.println("로그 : Calc 생성됨");
        if(op.equals("+")){
            this.res = num1 + num2;
        }
        else if(op.equals("-")){
            this.res = num1 - num2;
        }
        else if(op.equals("X")){
            this.res = num1 * num2;
        }
        else if(op.equals("/")){
            this.res = num1 / num2;
        }
    }

    public int getRes() {
        return res;
    }
    public void setRes(int res) {
        this.res = res;
    }
}
