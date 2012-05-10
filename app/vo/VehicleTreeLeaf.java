package vo;

/**
 * Created with IntelliJ IDEA.
 * User: JunXi
 * Date: 5/10/12
 * Time: 11:22 AM
 */
public class VehicleTreeLeaf
{
    public String id;
    public String text;
    public String imageUrl = "../../public/images/red-dot.png";

    public VehicleTreeLeaf(String id, String text)
    {
        this.id = id;
        this.text = text;
    }
}
