package vo;

/**
 * 这个对象是在 ${theme}/crud.html 使用的
 * @author weiwei
 *
 */
public class Grid {

	public String tabId;// tab的ID，grid的id组成部分
	public String readUrl;// 这个URL用来获取某个实体的列表数据
	public String updateUrl;// 这个URL用来更新某个实体数据
	public String destroyUrl;// 这个URL用来删除某个实体数据
	public String createUrl;// 这个URL用来增加某个实体数据
    public String searchUrl;// 这个URL用来增加某个实体数据
    public String editable = "popup";// Grid编辑方式，默认是弹出窗口"popup",还可以是："inline"
	public String columnsJson = "";// 这个是 Grid 的头部字段，可以使用 CommonUtil.assemColumns(class, unless); 来生成
	
	public String schema = "";
}
