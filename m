Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EF37E22B2
	for <lists+nbd@lfdr.de>; Mon,  6 Nov 2023 14:03:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 6E5562052C; Mon,  6 Nov 2023 13:03:40 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Nov  6 13:03:40 2023
Old-Return-Path: <lilingfeng@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=4.0 tests=CC_TOO_MANY,FOURLA,
	NICE_REPLY_A,RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id E5D6520418
	for <lists-other-nbd@bendel.debian.org>; Mon,  6 Nov 2023 12:45:11 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.048 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, FOURLA=0.1, NICE_REPLY_A=-3.137,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6YxPHI-5SZTE for <lists-other-nbd@bendel.debian.org>;
	Mon,  6 Nov 2023 12:45:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huaweicloud. - helo: .dggsgout12.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A617A20467
	for <nbd@other.debian.org>; Mon,  6 Nov 2023 12:44:58 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SP9zR04Z9z4f3jXR
	for <nbd@other.debian.org>; Mon,  6 Nov 2023 20:44:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 038651A016D
	for <nbd@other.debian.org>; Mon,  6 Nov 2023 20:44:52 +0800 (CST)
Received: from [10.174.179.155] (unknown [10.174.179.155])
	by APP1 (Coremail) with SMTP id cCh0CgDHyhC530hlK0HGAA--.32899S3;
	Mon, 06 Nov 2023 20:44:51 +0800 (CST)
Message-ID: <ae7a6b56-14c6-02e6-6e4b-572c23178049@huaweicloud.com>
Date: Mon, 6 Nov 2023 20:44:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH] nbd: fix uaf in nbd_open
To: Christoph Hellwig <hch@lst.de>
Cc: josef@toxicpanda.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, nbd@other.debian.org, axboe@kernel.dk,
 chaitanya.kulkarni@wdc.com, yukuai1@huaweicloud.com, houtao1@huawei.com,
 yi.zhang@huawei.com, yangerkun@huawei.com, lilingfeng3@huawei.com
References: <20231103101334.1750094-1-lilingfeng@huaweicloud.com>
 <20231103081251.GB16854@lst.de>
From: Li Lingfeng <lilingfeng@huaweicloud.com>
In-Reply-To: <20231103081251.GB16854@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDHyhC530hlK0HGAA--.32899S3
X-Coremail-Antispam: 1UD129KBjvdXoWrGr1fuFW8Kr43KF4DZr4fZrb_yoWxWFgEg3
	98Awn7XrWYqrW8GrsIyF1UXrs8JrWfK3yxAw1fXFn5WFyvqF95GF4xGrZYkayDCa1xC34q
	vrWYqF45WrWfCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
	3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU5nmRUUUUU
X-CM-SenderInfo: polox0xjih0w46kxt4xhlfz01xgou0bp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <v77u8s9UWaG.A.MVH.sQOSlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2667
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ae7a6b56-14c6-02e6-6e4b-572c23178049@huaweicloud.com
Resent-Date: Mon,  6 Nov 2023 13:03:40 +0000 (UTC)


在 2023/11/3 16:12, Christoph Hellwig 写道:
> On Fri, Nov 03, 2023 at 06:13:34PM +0800, Li Lingfeng wrote:
>> From: Li Lingfeng <lilingfeng3@huawei.com>
>>
>> Commit 4af5f2e03013 ("nbd: use blk_mq_alloc_disk and
>> blk_cleanup_disk") cleans up disk by blk_cleanup_disk() and it won't set
>> disk->private_data as NULL as before. UAF may be triggered in nbd_open()
>> if someone tries to open nbd device right after nbd_put() since refcount
>> of nbd device is zero and private_data is not NULL.
> I don't think this is the right fix.  nbd needs to move to ->free_disk
> to free it's private data.
Thanks for your advice, I will send v2 soon.

