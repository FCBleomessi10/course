package com.shu.content.model.po;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * <p>
 * 课程营销信息
 * </p>
 *
 * @author FCBleomessi10
 * @since 2023-05-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class CourseMarket implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键，课程id
     */
    private Long id;

    /**
     * 收费规则，对应数据字典
     */
    private String charge;

    /**
     * 现价
     */
    private Float price;

    /**
     * 原价
     */
    private Float originalPrice;

    /**
     * 咨询qq
     */
    private String qq;

    /**
     * 微信
     */
    private String wechat;

    /**
     * 电话
     */
    private String phone;

    /**
     * 有效期天数
     */
    private Integer validDays;


}
