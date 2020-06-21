package com.shixin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * @author 今何许
 * @date 2020/6/9 19:34
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("msg")
public class Msg {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String sender;
    private String receiver;
    private String title;
    private String content;
    private String date;
    private Integer count;
}
