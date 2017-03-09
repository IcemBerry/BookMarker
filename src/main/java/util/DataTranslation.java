package util;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by cacri on 2017/3/7.
 */
public class DataTranslation {
    public static java.util.Date stringToDate(String time){
        SimpleDateFormat formatter;
        int tempPos=time.indexOf("AD") ;
        time=time.trim() ;
        formatter = new SimpleDateFormat ("yyyy.MM.dd G 'at' hh:mm:ss z");
        if(tempPos>-1){
            time=time.substring(0,tempPos)+
                    "公元"+time.substring(tempPos+"AD".length());//china
            formatter = new SimpleDateFormat ("yyyy.MM.dd G 'at' hh:mm:ss z");
        }
        tempPos=time.indexOf("-");
        if(tempPos>-1&&(time.indexOf(" ")<0)){
            formatter = new SimpleDateFormat ("yyyyMMddHHmmssZ");
        }
        else if((time.indexOf("/")>-1) &&(time.indexOf(" ")>-1)){
            formatter = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
        }
        else if((time.indexOf("-")>-1) &&(time.indexOf(" ")>-1)){
            formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        }
        else if((time.indexOf("/")>-1) &&(time.indexOf("am")>-1) ||(time.indexOf("pm")>-1)){
            formatter = new SimpleDateFormat ("yyyy-MM-dd KK:mm:ss a");
        }
        else if((time.indexOf("-")>-1) &&(time.indexOf("am")>-1) ||(time.indexOf("pm")>-1)){
            formatter = new SimpleDateFormat ("yyyy-MM-dd KK:mm:ss a");
        }
        ParsePosition pos = new ParsePosition(0);
        java.util.Date ctime = formatter.parse(time, pos);

        return ctime;
    }

    public static String dateToString(java.util.Date time){
        SimpleDateFormat formatter;
        formatter = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String ctime = formatter.format(time);

        return ctime;
    }

}
