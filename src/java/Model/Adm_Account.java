
package Model;

/**
 *
 * @author ADMIN
 */
public class Adm_Account {
    
    private String tenadmin;
    private String taikhoan;
    private String matkhau;
    private String email;

    public Adm_Account(String tenadmin, String taikhoan, String matkhau, String email) {
        this.tenadmin = tenadmin;
        this.taikhoan = taikhoan;
        this.matkhau = matkhau;
        this.email = email;
    }

    public Adm_Account() {
    }

    public String getTenadmin() {
        return tenadmin;
    }

    public void setTenadmin(String tenadmin) {
        this.tenadmin = tenadmin;
    }

    public String getTaikhoan() {
        return taikhoan;
    }

    public void setTaikhoan(String taikhoan) {
        this.taikhoan = taikhoan;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
}
