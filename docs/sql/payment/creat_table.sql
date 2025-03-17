CREATE
DATABASE apay;

-- 创建支付订单表
CREATE TABLE `payment_order`
(
    `order_id`         VARCHAR(64)  NOT NULL COMMENT '支付订单号',
    `merchant_id`      VARCHAR(32)  NOT NULL COMMENT '商户ID',
    `amount`           BIGINT       NOT NULL COMMENT '金额（分）',
    `currency`         VARCHAR(3)   NOT NULL DEFAULT 'CNY' COMMENT '货币类型',
    `status`           TINYINT      NOT NULL DEFAULT 0 COMMENT '支付状态',
    `channel`          VARCHAR(20)  NOT NULL COMMENT '支付渠道',
    `channel_trade_no` VARCHAR(64) COMMENT '渠道交易号',
    `create_time`      DATETIME(3) NOT NULL COMMENT '创建时间',
    `update_time`      DATETIME(3) NOT NULL COMMENT '更新时间',
    `expire_time`      DATETIME(3) COMMENT '过期时间',
    `notify_url`       VARCHAR(255) NOT NULL COMMENT '通知地址',
    `metadata`         JSON COMMENT '扩展数据',
    PRIMARY KEY (`order_id`),
    UNIQUE KEY `uniq_channel_trade_no` (`channel`, `channel_trade_no`),
    KEY                `idx_merchant` (`merchant_id`),
    KEY                `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付订单表';

-- 创建退款记录表
CREATE TABLE `refund_record`
(
    `refund_id`         VARCHAR(64) NOT NULL COMMENT '退款单号',
    `order_id`          VARCHAR(64) NOT NULL COMMENT '原订单号',
    `refund_amount`     BIGINT      NOT NULL COMMENT '退款金额（分）',
    `status`            TINYINT     NOT NULL DEFAULT 0 COMMENT '退款状态',
    `channel_refund_no` VARCHAR(64) COMMENT '渠道退款号',
    `create_time`       DATETIME(3) NOT NULL COMMENT '创建时间',
    `update_time`       DATETIME(3) NOT NULL COMMENT '更新时间',
    `reason`            VARCHAR(255) COMMENT '退款原因',
    PRIMARY KEY (`refund_id`),
    KEY                 `idx_order_id` (`order_id`),
    KEY                 `idx_create_time` (`create_time`),
    CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `payment_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='退款记录表';