package calc;

public class CalcBean2 {
    private int num1;
    private int num2;
    private String op;
    private int res;

    public void calc(){
        if (this.op == null) {
            return;
        }
        if(this.op.equals("+")){
            this.res = this.num1 + this.num2;
        }
        else if(this.op.equals("-")){
            this.res = this.num1 - this.num2;
        }
        else if(this.op.equals("*")){
            this.res = this.num1 * this.num2;
        }
        else if(this.op.equals("/")){
            this.res = this.num1 / this.num2;
        }
    }

    public int getNum1() {
        return num1;
    }

    public void setNum1(int num1) {
        this.num1 = num1;
    }

    public int getNum2() {
        return num2;
    }

    public void setNum2(int num2) {
        this.num2 = num2;
    }

    public String getOp() {
        return op;
    }

    public void setOp(String op) {
        this.op = op;
    }

    public int getRes() {
        return res;
    }

    public void setRes(int res) {
        this.res = res;
    }
}
