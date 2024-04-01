package dog.sql;

public class GboardSQL {
	public final int SEL_ALL_LIST = 1001;
	public final int SEL_ID_CNT = 1002;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_ALL_LIST:
			buff.append("SELECT ");
			buff.append("	gno, mno, id, filename sname, wdate, body ");
			buff.append("FROM ");
			buff.append("	member, avatar, gboard ");
			buff.append("WHERE ");
			buff.append("	mno = writer ");
			buff.append("	AND avatar = ano ");
			buff.append("ORDER BY ");
			buff.append("	wdate DESC ");
			break;
			
		case SEL_ID_CNT:
			buff.append("SELECT ");
			buff.append("	Count(*) cnt ");
			buff.append("FROM ");
			buff.append("    member, gboard ");
			buff.append("WHERE ");
			buff.append("   id = ? ");
			buff.append("   AND mno = writer ");
			break;
		}
		
		return buff.toString();
	}
}
