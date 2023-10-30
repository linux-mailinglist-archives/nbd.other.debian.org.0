Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B547DBAD8
	for <lists+nbd@lfdr.de>; Mon, 30 Oct 2023 14:33:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 251B520769; Mon, 30 Oct 2023 13:33:14 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 30 13:33:14 2023
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=CC_TOO_MANY,NICE_REPLY_A,
	RCVD_IN_MSPIKE_H2,RDNS_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0B71020736
	for <lists-other-nbd@bendel.debian.org>; Mon, 30 Oct 2023 13:16:39 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.783 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, NICE_REPLY_A=-3.058,
	RCVD_IN_MSPIKE_H2=-0.518, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id LTUh5ypO8BFY for <lists-other-nbd@bendel.debian.org>;
	Mon, 30 Oct 2023 13:16:31 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huaweicloud. - helo: .dggsgout12.his.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from dggsgout12.his.huawei.com (unknown [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 4911320730
	for <nbd@other.debian.org>; Mon, 30 Oct 2023 13:16:28 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SJv0v5zG8z4f3kpN
	for <nbd@other.debian.org>; Mon, 30 Oct 2023 21:16:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id E4B831A016E
	for <nbd@other.debian.org>; Mon, 30 Oct 2023 21:16:21 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgB3BdWkrD9lfwF3EQ--.58447S3;
	Mon, 30 Oct 2023 21:16:21 +0800 (CST)
Subject: Re: [PATCH] nbd: pass nbd_sock to nbd_read_reply() instead of index
To: Ming Lei <ming.lei@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: linan666@huaweicloud.com, josef@toxicpanda.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, linan122@huawei.com, yi.zhang@huawei.com,
 houtao1@huawei.com, yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20230911023308.3467802-1-linan666@huaweicloud.com>
 <ZRT7cVFcE6QMHfie@fedora>
 <47669fb6-3700-e327-11af-93a92b0984a0@huaweicloud.com>
 <ZRUt/vAQNGNp6Ugx@fedora>
 <41161d21-299c-3657-6020-0a3a9cf109ec@huaweicloud.com>
 <ZRU/7Bx1ZJSX3Qg3@fedora>
 <60f9a88b-b750-3579-bdfd-5421f2040406@huaweicloud.com>
 <ZRVGWkCzKAVVL9bV@fedora>
 <bbadaad4-172e-af7b-2a47-52f7e7c83423@huaweicloud.com>
 <a6393a45-8510-5734-c174-0826c7d76675@huaweicloud.com>
 <ZT+kzw3Zm/3XJqD7@fedora>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <cc6274c3-b9ba-cd6e-5ef4-af736b1a1f13@huaweicloud.com>
Date: Mon, 30 Oct 2023 21:16:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ZT+kzw3Zm/3XJqD7@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgB3BdWkrD9lfwF3EQ--.58447S3
X-Coremail-Antispam: 1UD129KBjvdXoWrXr48tF13Xryxuw1xAF4kXrb_yoWxGFg_WF
	y8Kr18Xw43JFn8t34jkryfXa1rWF1FqryrXrW0vw45Xw1UW34kKr95X3sIyw17Ga18Cwn2
	9r95X3yjg3srujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
	3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cL6pbfjvVEE.A.suE.aC7PlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2664
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/cc6274c3-b9ba-cd6e-5ef4-af736b1a1f13@huaweicloud.com
Resent-Date: Mon, 30 Oct 2023 13:33:14 +0000 (UTC)

在 2023/10/30 20:42, Ming Lei 写道:

>> After reviewing some code, I found that it's wrong to grab config_lock,
>> because other context will grab such lock and flush_workqueue(), and
>> there is no gurantee that recv_work() will grab the lock first.
>>
>> Will it be acceptable to export blk_queue_enter()? I can't think of
>> other way to retrieve the`nsock` reference at the entry of recv_work().
> 
> Then I think it is easier to pass `nsock` from `recv_thread_args`, which
> can be thought as local variable too.
> 
> Reviewed-by: Ming Lei <ming.lei@redhat.com>

Agreed

Reviewed-by: Yu Kuai <yukuai3@huawei.com>

