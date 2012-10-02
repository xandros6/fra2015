package it.geosolutions.fao.core.model.user;

import java.io.Serializable;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.*;

/**
 *
 * @author francesco
 */
@Embeddable
public class Password implements Serializable {

    public final static String MD5 = "MD5";
    private final static long serialVersionUID = 834894858L;
    @Column(nullable = false)
    protected String password;
    @Column(nullable = false)
    protected String algorithm = MD5;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return getPassword().substring(getPassword().lastIndexOf(":") + 1);
    }

    public String geDigest() {
        return getPassword().substring(0, getPassword().lastIndexOf(":"));
    }

    public boolean check(String str) {
        try {
            String hash = encryptPassword(str.getBytes(), getSalt(), "MD5");

            return (hash.equals(getPassword()));

        } catch (NoSuchAlgorithmException e) {
            Logger.getLogger(Password.class.getName()).log(Level.SEVERE, null, e);
            return false;
        }
    }

    public static String encryptPassword(byte[] bytes, String salt, String algorithm) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance(algorithm);

        md.update(salt.getBytes());
        md.update(bytes);

        BigInteger hash = new BigInteger(1, md.digest());

        StringBuilder sb = new StringBuilder(hash.toString(16));

        if (sb.length() % 2 != 0) {
            sb.append("0");
        }

        sb.append(":").append(salt);

        return sb.toString();

    }
}
