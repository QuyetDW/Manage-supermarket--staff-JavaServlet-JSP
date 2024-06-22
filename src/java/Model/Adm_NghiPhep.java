
package Model;

/**
 *
 * @author ADMIN
 */
public class Adm_NghiPhep {
    private String trangthai;
    private int count;

    public Adm_NghiPhep(String trangthai, int count) {
        this.trangthai = trangthai;
        this.count = count;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    

}
