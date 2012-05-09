package vo;

import java.util.HashSet;
import java.util.Set;

public class VehicleTree {

    public String id;
    public String text;
    public boolean expanded = true;
    public Set<VehicleTree> items = new HashSet<VehicleTree>();

    public VehicleTree(String id, String text) {
        super();
        this.id = id;
        this.text = text;
    }


}
