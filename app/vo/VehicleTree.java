package vo;

import java.util.HashSet;
import java.util.Set;

public class VehicleTree {

    public String id;
    public String text;
    public boolean expanded = false;
    public String imageUrl = "../../public/images/fleet.png";
    public Set<VehicleTreeLeaf> items = new HashSet<VehicleTreeLeaf>();

    public VehicleTree(String id, String text) {
        super();
        this.id = id;
        this.text = text;
    }


}
