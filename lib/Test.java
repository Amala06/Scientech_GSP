import java.util.ArrayList;
import java.util.List;

public class Test{
    static void fun(int [] arr,List <Integer> cur ,List<List<Integer>>res,int count,int num){
        if(cur.size()==num){
            res.add(cur);
            System.out.println(cur.toString());
            return;
        }
        if(count>=arr.length){
return;
        }
        cur.add(arr[count]);
        for(int i=0;i<arr.length-1;i++){
            fun(arr,cur,res,count++,num);
            cur.remove(cur.size()-1);
        }
    }

static void fun1(int num,int sum,String s,int count ){
    if(count<=0)return ;
    if(sum==num){
         StringBuilder sb=new StringBuilder(s);  
    sb.reverse();  
        System.out.println(sb);
        return ;
    }
    if(sum>count){
        return;
    }
    if(sum<count){
        s+=num+' ';
        sum+=num;
        fun1(num,sum,s,count);
    }
    fun1(num+1,sum,s,count);
    // fun1(num,)
}

public static void main(String[] args) {
    int arr[]={1,2,3,4,5};
    fun(arr,new ArrayList(),res,0,2);
    String s="";    
    fun1(1,0,s,4);
}
}