package utils;


/**
 * 字符串截断工具类。 
 * <p>e.g 根据大写截断 1.把 " HelloWorld " 截断分成 " hello world "</p>
 * 
 * <pre>
 * Splitter.init("HelloWorld").byUpperCase().connect(" ").split().lowerFirst().toString()
 * </pre>
 * 
 * <p>2.把 " HelloWorld " 截断分成 " hello-world "</p>
 * 
 * <pre>
 * Splitter.init("HelloWorld").byUpperCase().connect("-").split().lowerFirst().toString()
 * </pre>
 * 
 * <p>e.g 根据给定特征点截断 1.把 " hello-world " 按照 '-' 截断分成 " Hello World "</p>
 * 
 * <pre>
 * Splitter.init("hello-world").by("-").connect(" ").split().upperFirst().toString()
 * </pre>
 * 
 * <p>2.把 " hello-world " 按照 '-' 截断分成 " Hello#World "</p>
 * 
 * <pre>
 * Splitter.init("hello-world").by("-").connect("#").split().toString()
 * </pre>
 * 
 * <p>e.g 综合 1.把 " demo.displayName " 按照 '.' 和 大写 截断分成 " Demo Display Name "</p>
 * 
 * <pre>
 * Splitter.init("demo.displayName").byUpperCase().by(".").connect(" ").split().upperFirst().toString()
 * </pre>
 * 
 * <p>2.把 " demo.displayName_test " 按照 '.'、大写、'_' 截断分成 " Demo Display Name Test "</p>
 * 
 * <pre>
 * Splitter.init("demo.displayName_test").byUpperCase().by(".", "_").connect(" ").split().upperFirst().toString()
 * </pre>
 * 
 * <p>3.把 " doHelloAtGetOrPost " 按照 'do'、'At'、'Or' 截断分成</p>
 * " /hello@get|post "
 * 
 * <pre>
 * Splitter.init("doHelloAtGetOrPost").by("do", "At", "Or").connect("/", "@", "|").split().lowerFirst().toString()
 * </pre>
 * 
 * @author weiwei
 * 
 */
public class Splitter {

	public static Splitter init(String source) {
		return new Splitter(source);
	}

	public Splitter(String source) {
		this.source = source;
		result = new StringBuilder(this.source);
	}

	private StringBuilder result;
	private String source;
	private String[] cons;
	private String[] bys;
	private boolean byUpperCase = false;

	private void splitByUpperCase() {
		char[] chars = result.toString().toCharArray();

		int inc = 0;
		for (int i = 1; i < chars.length; i++) {
			String s = String.valueOf(chars[i]);
			if (this.byUpperCase && s.matches("[A-Z]")) {
				int index = i + inc;
				result.insert(index, cons[0]);
				inc += inc + cons[0].length();
				continue;
			}
		}
	}

	public Splitter connect(String... cons) {
		this.cons = cons;

		return this;
	}

	public Splitter by(String... bys) {
		this.bys = bys;
		return this;
	}

	public Splitter byUpperCase() {
		this.byUpperCase = true;
		return this;
	}

	public Splitter split() {
		if (this.byUpperCase) {
			this.splitByUpperCase();
		}

		if (bys == null)
			return this;

		for (int i = 0; i < bys.length; i++) {
			String con = null;
			if (bys.length > cons.length && cons.length == 1){
				con = cons[0];
			}else{
				con = cons[i];
			}
			
			result = new StringBuilder(result.toString().replace(bys[i],con));
		}

		return this;
	}

	public Splitter upperFirst() {
		if (bys == null)
			bys = new String[1];
		
		for (int i = 0; i < bys.length; i++) {
			String con = null;
			if (bys.length > cons.length && cons.length == 1){
				con = cons[0];
			}else{
				con = cons[i];
			}
			
			String[] strs = result.toString().replace(con, "_##_").split("_##_");
			StringBuilder sb = new StringBuilder();
			for (String s : strs) {
				if (sb.length() > 0)
					sb.append(con);
				if (s.trim().length() == 0)
					continue;

				if (s.length() <= 1)
					sb.append(s.toUpperCase());
				else
					sb.append(s.replaceFirst(s.substring(0, 1),s.substring(0, 1).toUpperCase()));
			}

			result = new StringBuilder(sb.toString());
		}
		
		return this;
	}

	public Splitter lowerFirst() {
		if (bys == null)
			bys = new String[1];
		
		for (int i = 0; i < bys.length; i++) {
			String con = null;
			if (bys.length > cons.length && cons.length == 1){
				con = cons[0];
			}else{
				con = cons[i];
			}
			
			String start = null;
			if (result.toString().startsWith(con)){
				start = con;
			}
			
			String[] strs = result.toString().replace(con, "_##_").split("_##_");
			
			StringBuilder sb = new StringBuilder();
			for (String s : strs) {
				if (sb.length() > 0)
					sb.append(con);
				
				if (s.trim().length() == 0)
					continue;

				if (s.length() <= 1)
					sb.append(s.toLowerCase());
				else
					sb.append(s.replaceFirst(s.substring(0, 1),
							s.substring(0, 1).toLowerCase()));
			}

			if (start != null)
				sb.insert(0, start);
			
			result = new StringBuilder(sb.toString());
		}
		return this;
	}

	public String toString() {
		return result.toString();
	}

	public static void main(String[] args) {
		System.out.println(Splitter.init("HelloWorld").byUpperCase().connect(" ").split().lowerFirst().toString());
		System.out.println(Splitter.init("HelloWorld").byUpperCase().connect("-").split().lowerFirst().toString());
		System.out.println(Splitter.init("hello-world").by("-").connect(" ").split().upperFirst().toString());
		System.out.println(Splitter.init("hello-world").by("-").connect("#").split().upperFirst().toString());
		System.out.println(Splitter.init("demo.displayName").byUpperCase().by(".").connect(" ").split().upperFirst().toString());
		System.out.println(Splitter.init("demo.displayName_test").byUpperCase().by(".", "_").connect(" ").split().upperFirst().toString());
		System.out.println(Splitter.init("doHelloAtGetOrPost").by("do", "At", "Or").connect("/", "@", "|").split().lowerFirst().toString());
	}

}
