package com.book.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;
import com.book.domain.Lend;

import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
@Repository
public class LendDao {

    private JdbcTemplate jdbcTemplate;
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private final static String BOOK_RETURN_SQL_ONE="UPDATE lend_list SET back_date = ? WHERE book_id = ? AND back_date is NULL";

    private final static String BOOK_RETURN_SQL_TWO="UPDATE book_info SET state = 1 WHERE book_id = ? ";

    private final static String BOOK_LEND_SQL_ONE="INSERT INTO lend_list (sernum,book_id,reader_id,lend_date) VALUES ((SELECT MAX(sernum) + 1 FROM lend_list), ? , ? , ? )";

    private final static String BOOK_LEND_SQL_TWO="UPDATE book_info SET state = 0 WHERE book_id = ? ";

    private final static String LEND_LIST_SQL="SELECT * FROM lend_list";

    private final static String MY_LEND_LIST_SQL="SELECT * FROM lend_list WHERE reader_id = ? ";

    private final static String CHECK_BOOK="SELECT COUNT(*) FROM lend_list WHERE reader_id = ? AND book_id=? AND back_date is NULL";//@@@@@@@@@@@@@@@@@2

    public int bookReturnOne(long bookId){
        Date date = new Date(); // 使用无参构造函数创建当前时间的 Date 对象
        String formattedDate = df.format(date);
        System.out.println(formattedDate); // 输出当前时间
        return  jdbcTemplate.update(BOOK_RETURN_SQL_ONE,new Object[]{date,bookId});
    }
    public int bookReturnTwo(long bookId){

        return jdbcTemplate.update(BOOK_RETURN_SQL_TWO,new Object[]{bookId});
    }
    public int bookLendOne(long bookId,int readerId){
        Date date = new Date(); // 使用无参构造函数创建当前时间的 Date 对象
        String formattedDate = df.format(date);
        System.out.println("BookLendOne:"+bookId+readerId+date); // 输出当前时间

        return  jdbcTemplate.update(BOOK_LEND_SQL_ONE,new Object[]{bookId,readerId,date});
    }

    public int bookCheck(long bookId,int readerId){


        return  jdbcTemplate.update(CHECK_BOOK,new Object[]{readerId,bookId});
    }//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

    public int bookLendTwo(long bookId){

        return  jdbcTemplate.update(BOOK_LEND_SQL_TWO,new Object[]{bookId});
    }

    public ArrayList<Lend> lendList(){
        final ArrayList<Lend> list=new ArrayList<Lend>();

        jdbcTemplate.query(LEND_LIST_SQL, new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                //resultSet.beforeFirst();
                while (resultSet.next()){
                    Lend lend=new Lend();
                    lend.setBackDate(resultSet.getDate("back_date"));
                    lend.setBookId(resultSet.getLong("book_id"));
                    lend.setLendDate(resultSet.getDate("lend_date"));
                    lend.setReaderId(resultSet.getInt("reader_id"));
                    lend.setSernum(resultSet.getLong("sernum"));
                    list.add(lend);
                }
            }
        });
        return list;
    }

    public ArrayList<Lend> myLendList(int readerId){
        final ArrayList<Lend> list=new ArrayList<Lend>();

        jdbcTemplate.query(MY_LEND_LIST_SQL, new Object[]{readerId},new RowCallbackHandler() {
            public void processRow(ResultSet resultSet) throws SQLException {
                //resultSet.beforeFirst();
                while (resultSet.next()){
                    Lend lend=new Lend();
                    lend.setBackDate(resultSet.getDate("back_date"));
                    lend.setBookId(resultSet.getLong("book_id"));
                    lend.setLendDate(resultSet.getDate("lend_date"));
                    lend.setReaderId(resultSet.getInt("reader_id"));
                    lend.setSernum(resultSet.getLong("sernum"));
                    list.add(lend);
                }
            }
        });
        return list;

    }
}
