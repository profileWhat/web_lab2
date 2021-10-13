package Data;

public class ResultTable {
    private final double x;
    private final double y;
    private final double r;
    private final String currTime;
    private final boolean hit;

    public ResultTable(double x, double y, double r, String currTime, boolean hit) {
        this.currTime = currTime;
        this.hit = hit;
        this.r = r;
        this.y = y;
        this.x = x;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public String getCurrTime() {
        return currTime;
    }

    public boolean getHit() {
        return hit;
    }

}
