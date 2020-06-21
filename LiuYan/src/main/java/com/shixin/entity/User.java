package com.shixin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 今何许
 * @date 2020/6/9 19:32
 */
@TableName("user")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    @TableId
    private String username;
    private String password;
    private Integer privilege;
    private String email;
}
