package bean;

import java.sql.*;
import java.util.*;
public class JFBean {

  private Connection 	con 	= null;				//���ݿ�����
  private ResultSet 	rs   	= null;				//ԭʼ�����
  private Statement     stmt      = null;
  //���Ӳ���
  private final String        DBURL   = "jdbc:odbc:bysj";
  private final String        DBUSER  ="sa";
  private final String        DBPASSWORD  ="";

  private ArrayList result = new ArrayList(); //��Ž����
  String[] colName = null;
  private int colLen = 0; //����
  private String empty	= "";	//�滻������еĿ��ַ�

  public JFBean() {
  }

public void ini() throws SQLException {
    try {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      if ( (con == null) || con.isClosed())
        con = DriverManager.getConnection(DBURL,DBUSER, DBPASSWORD);
      stmt = con.createStatement();
    }
    catch (SQLException e) {
      throw e;
    }catch(Exception e){
      System.out.println("load driver error");
    }

  }

  public ArrayList getRS() {
    return result;
  }


  /**
   * ִ�����ݲ�ѯ,�����������(ÿһ�е�����)��ʽ�����ArrayList��
   *
   * @param sqlStatement String ��ѯ��SQL���
   * @retrurn rownum
   *
   */
  public int execQuery(String sqlStatement) throws SQLException {
    int recounter = 0;
    clearResult();
    try {
      ini();
      rs = stmt.executeQuery(sqlStatement);
      ResultSetMetaData rsmd = rs.getMetaData();
      String self = null;
      colLen = rsmd.getColumnCount() ;
      while (rs.next()) {
        String[] colValue = new String[colLen];
        for (int i = 0; i < colLen; i++) {
          colValue[i] = ( (self = rs.getString(i + 1 )) == null ?empty :
                         self.trim().length() == 0 ? empty : self.trim());
        }
        result.add(colValue);
        recounter++;
      }
      return recounter;
    }
    catch (SQLException e) {
      throw e;
    }
    finally {
      closeConn();
    }
  }

  /**
   * ִ�����ݲ�ѯ,�������HashMap(ÿһ�е�����)��ʽ�����ArrayList��
   *
   * @param sqlStatement String 	��ѯ��SQL���
   * @retrurn rownum
   */
  public int execQueryName(String sqlStatement) throws SQLException {
    int recounter = 0;
    clearResult();
    try {
      ini();
      rs = stmt.executeQuery(sqlStatement);
      ResultSetMetaData rsmd = rs.getMetaData();
      String self = null;
      colLen = rsmd.getColumnCount() ;
      colName = new String[colLen];
      for (int i = 0; i < colLen; i++) {
        colName[i] = rsmd.getColumnName(i + 1);
      }
      while (rs.next()) {
        HashMap colValue = new HashMap();
        for (int i = 0; i < colLen; i++) {
          colValue.put(colName[i],
                       (self = rs.getString(i + 1 )) == null ? empty :
                       self.trim().length() == 0 ? empty : self.trim());
        }
        result.add(colValue);
        recounter++;
      }
      return recounter;
    }
    catch (SQLException e) {
      throw e;
    }
    finally {
      closeConn();
    }
  }

  /**
   * ִ��һ��û�з��ؽ������SQL
   *
   * @param sqlStatement String SQL�ű�
   * @retrurn int �ɹ�����־
   *
   */
  public int execUpdate(String sqlStatement) throws SQLException {
    try {
      ini();
      int recounter = stmt.executeUpdate(sqlStatement);
      return recounter;
    }
    catch (SQLException e) {
      throw e;
    }
    finally {
      closeConn();
    }
  }
  /**
   * ����Զ���Ľ����
   */
  public void clearResult() {
    if (result.size() > 0)
      result.clear();
  }


  // Release the SQL statement resources
  private void closeConn() throws SQLException {
    try {
      if (con != null) {
        stmt.close();
        con.close();
        stmt = null;
        con = null;
      }
    }
    catch (SQLException e) {
      throw e;
    }
  }




}
