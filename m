Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 237CA7F25C5
	for <lists+nbd@lfdr.de>; Tue, 21 Nov 2023 07:33:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0516B2086A; Tue, 21 Nov 2023 06:33:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov 21 06:33:12 2023
Old-Return-Path: <linan666@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=CC_TOO_MANY,NICE_REPLY_A,
	RCVD_IN_MSPIKE_H2,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BD8502066B
	for <lists-other-nbd@bendel.debian.org>; Tue, 21 Nov 2023 06:17:02 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.148 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, NICE_REPLY_A=-3.137,
	RCVD_IN_MSPIKE_H2=-0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id OYzSRVfFDsU5 for <lists-other-nbd@bendel.debian.org>;
	Tue, 21 Nov 2023 06:16:54 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2381D2043F
	for <nbd@other.debian.org>; Tue, 21 Nov 2023 06:16:53 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4SZDfh3hqHz4f3l8b
	for <nbd@other.debian.org>; Tue, 21 Nov 2023 14:16:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 31AA81A03FD
	for <nbd@other.debian.org>; Tue, 21 Nov 2023 14:16:47 +0800 (CST)
Received: from [10.174.179.247] (unknown [10.174.179.247])
	by APP1 (Coremail) with SMTP id cCh0CgBXWhBCS1xldFINBg--.30356S3;
	Tue, 21 Nov 2023 14:16:42 +0800 (CST)
Message-ID: <b36401c6-36b8-3855-d7c3-9788b88e1b51@huaweicloud.com>
Date: Tue, 21 Nov 2023 14:16:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] nbd: pass nbd_sock to nbd_read_reply() instead of index
To: Jens Axboe <axboe@kernel.dk>
Cc: linan666@huaweicloud.com, josef@toxicpanda.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, houtao1@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>,
 Ming Lei <ming.lei@redhat.com>
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
 <cc6274c3-b9ba-cd6e-5ef4-af736b1a1f13@huaweicloud.com>
From: Li Nan <linan666@huaweicloud.com>
In-Reply-To: <cc6274c3-b9ba-cd6e-5ef4-af736b1a1f13@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBXWhBCS1xldFINBg--.30356S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWDKF13Jr1ktrWfAw43Wrg_yoW3Zrb_WF
	W0kr18Xw43JFnYqF9FkryfXrs3WF1Fq34rXr4Fvw45Xw13u3ykKF93X39avw18Gay8Cwn2
	kr95W3yjg39xWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwACI402YVCY1x02628vn2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5vtCUUUUU
X-CM-SenderInfo: polqt0awwwqx5xdzvxpfor3voofrz/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Af0DBId-cPM.A.U3E.o8EXlB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2677
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b36401c6-36b8-3855-d7c3-9788b88e1b51@huaweicloud.com
Resent-Date: Tue, 21 Nov 2023 06:33:13 +0000 (UTC)

Hi, Jens

This patch has been reviewed by Yu Kuai and Ming Lei. Could you please
consider apply it?

在 2023/10/30 21:16, Yu Kuai 写道:
> 在 2023/10/30 20:42, Ming Lei 写道:
> 
>>> After reviewing some code, I found that it's wrong to grab config_lock,
>>> because other context will grab such lock and flush_workqueue(), and
>>> there is no gurantee that recv_work() will grab the lock first.
>>>
>>> Will it be acceptable to export blk_queue_enter()? I can't think of
>>> other way to retrieve the`nsock` reference at the entry of recv_work().
>>
>> Then I think it is easier to pass `nsock` from `recv_thread_args`, which
>> can be thought as local variable too.
>>
>> Reviewed-by: Ming Lei <ming.lei@redhat.com>
> 
> Agreed
> 
> Reviewed-by: Yu Kuai <yukuai3@huawei.com>
> 
> .

-- 
Thanks,
Nan

