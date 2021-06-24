package cn.edu.hzvtc.test;

import java.util.Random;

/**
 * @author: XuYi
 * @date: 2021/6/24 10:17
 * @description:
 */
public class codeTest {
    public static void main(String[] args) {
        Random random = new Random();

        String ans = "";
        for (int i = 0; i < 6; i++){
            ans+= random.nextInt(10);
        }
        System.out.println("随机验证码："+ans);
    }
}
