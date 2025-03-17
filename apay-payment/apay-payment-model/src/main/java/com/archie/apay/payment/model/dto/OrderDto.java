package com.archie.apay.payment.model.dto;

import com.baomidou.mybatisplus.annotation.TableName;

import lombok.Data;

/**
 * 支付单
 *
 * @author lavyoung1325 <2034549297@qq.com>
 * Created on 2025-03-17
 */
@Data
@TableName("apay_payment_order")
public class OrderDto {

    private Long id;

    private String orderId;

    private String userId;

    private String productId;
}
