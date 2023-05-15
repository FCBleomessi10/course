package com.shu.base.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PageParams {
    private Long pageNo = 1L;   // 当前页码
    private Long pageSize = 30L;    // 每页记录数
}
