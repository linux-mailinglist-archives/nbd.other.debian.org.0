Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD99DC12D
	for <lists+nbd@lfdr.de>; Fri, 29 Nov 2024 10:12:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 935422067A; Fri, 29 Nov 2024 09:12:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Nov 29 09:12:13 2024
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=4.0 tests=NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,TO_TOO_MANY autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 12A89206FD
	for <lists-other-nbd@bendel.debian.org>; Fri, 29 Nov 2024 08:56:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-5.866 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, MIME_CHARSET_FARAWAY=0.02, NICE_REPLY_A=-2.588,
	RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, TO_TOO_MANY=1]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 47upxrFPR7HB for <lists-other-nbd@bendel.debian.org>;
	Fri, 29 Nov 2024 08:56:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1160 seconds by postgrey-1.36 at bendel; Fri, 29 Nov 2024 08:56:35 UTC
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 0BDE6206F2
	for <nbd@other.debian.org>; Fri, 29 Nov 2024 08:56:34 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Y063h2QWDz4f3jXc
	for <nbd@other.debian.org>; Fri, 29 Nov 2024 16:36:48 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 2C47E1A0196
	for <nbd@other.debian.org>; Fri, 29 Nov 2024 16:37:07 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgCXc4cxfUlnCQufDA--.43500S3;
	Fri, 29 Nov 2024 16:37:07 +0800 (CST)
Subject: Re: blktests failures with v6.12 kernel
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "yukuai (C)" <yukuai3@huawei.com>
References: <6crydkodszx5vq4ieox3jjpwkxtu7mhbohypy24awlo5w7f4k6@to3dcng24rd4>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <aef69ffa-e556-7eeb-4344-351c66266ee4@huaweicloud.com>
Date: Fri, 29 Nov 2024 16:37:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6crydkodszx5vq4ieox3jjpwkxtu7mhbohypy24awlo5w7f4k6@to3dcng24rd4>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCXc4cxfUlnCQufDA--.43500S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr1fGw1fuFyfCFy5Jr47urg_yoWDJrXEvw
	17CF93G3yxAry0vFn7KFn29rW7KFZ09w17try8Xrna9as5tFykJFsIvrZI9ryDCw1rZr9I
	v3y5WF48ua1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4AYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AK
	xVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
	6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1veHD
	UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <WO-mDbGji4.A.HK8.tVYSnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3195
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/aef69ffa-e556-7eeb-4344-351c66266ee4@huaweicloud.com
Resent-Date: Fri, 29 Nov 2024 09:12:13 +0000 (UTC)

Hi,

ÔÚ 2024/11/26 10:19, Shinichiro Kawasaki Ð´µÀ:
> #5: throtl/001 (CKI project, s390 arch)
> 
>    Recently, CKI project added a configuration to run the blktests thortl group,
>    and failures have been repeatedly observed for s390 architecture [7]. I
>    suspect the failure message below implies that system performance may affect
>    the test result. Further debug is needed.
> 
>    throtl/001 (basic functionality)                             [failed]
>        runtime    ...  6.309s
>        --- tests/throtl/001.out	2024-11-23 20:53:13.446546653 +0000
>        +++ /mnt/tests/s3.amazonaws.com/arr-cki-prod-lookaside/lookaside/kernel-tests-public/kernel-tests-production.zip/storage/blktests/throtl/blktests/results/nodev/throtl/001.out.bad	2024-11-23 20:53:21.332699696 +0000
>        @@ -1,6 +1,6 @@
>         Running throtl/001
>        +2
>         1
>        -1
>        -1
>        +2
>         1

Perhaps can we have a quick try, and check if issuing IO to a null_blk
in this platform, the latency can't be ignored in seconds.

Thanks,
Kuai

