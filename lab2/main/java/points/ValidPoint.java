package points;

public class ValidPoint {

    private double x;
    private double y;
    private double r;

    private String result;
    private String date;
    private long time;

    public ValidPoint(double x, double y, double r, String result, String date, long time) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.result = result;
        this.date = date;
        this.time = time;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public double getR() {
        return r;
    }

    public void setR(double r) {
        this.r = r;
    }


    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }
}