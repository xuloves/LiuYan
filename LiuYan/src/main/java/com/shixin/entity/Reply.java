package com.shixin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 今何许
 * @date 2020/6/10 21:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("reply")
public class Reply {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String mid;
    private String commentator;
    private String content;
    private String date;
}
