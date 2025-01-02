package com.baomidou.mybatisplus.generator;

import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;

import java.io.*;
import java.net.URI;

public class Dlt {
    public static void main(String[] args) throws Exception {
        File file = new File("dlt.csv");
        if (file.exists()) {
            file.delete();
        }
        file.createNewFile();
        FileOutputStream fos = new FileOutputStream(file);
        OutputStreamWriter writer = new OutputStreamWriter(fos);
        writer.write("期号,日期,结果\r\n");
        for (int i = 0; i < 100; i++) {
            String url = String.format("https://webapi.sporttery.cn/gateway/lottery/getHistoryPageListV1.qry?gameNo=85&provinceId=0&pageSize=30&isVerify=1&termLimits=0&pageNo=%d", i);
            String result = IOUtils.toString(new URI(url), "UTF-8");
            JsonNode jsonNode = new ObjectMapper().readTree(new ByteArrayInputStream(result.getBytes()));
            ArrayNode list = (ArrayNode) jsonNode.get("value").get("list");
            for (JsonNode node : list) {
                String no = node.get("lotteryDrawNum").toString();
                String date = node.get("lotteryDrawTime").toString();
                String numbers = node.get("lotteryDrawResult").toString();
                writer.write(String.format("%s,%s,%s\r\n", no, date, numbers));
            }
        }
        writer.flush();
        System.out.println(file.getAbsolutePath());
    }
}
