package com.shu.base.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PageParams {

    @ApiModelProperty("页码")
    private Long pageNo = 1L;

    @ApiModelProperty("每页记录数")
    private Long pageSize = 30L;
}
