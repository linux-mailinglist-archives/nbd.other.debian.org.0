Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BB863700B
	for <lists+nbd@lfdr.de>; Thu, 24 Nov 2022 02:54:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E9F69205CB; Thu, 24 Nov 2022 01:54:25 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 24 01:54:25 2022
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RDNS_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A60432058F
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Nov 2022 01:36:37 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.188 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RDNS_NONE=0.793] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Tn7Kbpha-iDA for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Nov 2022 01:36:30 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 1108 seconds by postgrey-1.36 at bendel; Thu, 24 Nov 2022 01:36:30 UTC
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 16C7A20524
	for <nbd@other.debian.org>; Thu, 24 Nov 2022 01:36:29 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NHg8t3r5wz4f3tq0
	for <nbd@other.debian.org>; Thu, 24 Nov 2022 09:17:50 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgD3GthAxn5jsBE0BA--.21372S3;
	Thu, 24 Nov 2022 09:17:53 +0800 (CST)
Subject: Re: nbd: please don't spawn 16 threads when nbd is not even in use
To: Pavel Machek <pavel@ucw.cz>, Eric Blake <eblake@redhat.com>
Cc: kernel list <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 "yukuai (C)" <yukuai3@huawei.com>
References: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
 <20221123200845.cuct5euvikqksojm@redhat.com> <Y36YHNVmbozzSdxH@duo.ucw.cz>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <ccee0ff5-309c-b430-09c7-8d2081c9981d@huaweicloud.com>
Date: Thu, 24 Nov 2022 09:17:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Y36YHNVmbozzSdxH@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgD3GthAxn5jsBE0BA--.21372S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy8WrWfWFyftrWfZFyxXwb_yoW3AFX_WF
	W7ZFyDGw4UXF18Ja1qkF1rWFW8Xrs7XF4jqasxtwsrJw43W3s3uF4DWry3Zw4UGw4YyFnx
	ur1UZay7Ar47ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrR6zUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZXJkLEFkc3L.A.uaE.R7sfjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2305
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ccee0ff5-309c-b430-09c7-8d2081c9981d@huaweicloud.com
Resent-Date: Thu, 24 Nov 2022 01:54:25 +0000 (UTC)

Hi,

在 2022/11/24 6:01, Pavel Machek 写道:
> Hi!
> 
>>> I see this... and it looks like there are 16 workqueues before nbd is
>>> even used. Surely there are better ways to do that?
>>
>> Yes, it would be nice to create a pool of workers that only spawns up
>> threads when actual parallel requests are made.  Are you willing to
>> help write the patch?
> 
> I was thinking more "only spawn a workqueue when nbd is opened" or so.
> 
> I have 16 of them, and I'm not using nbd. Workqueue per open device is
> okay, current situation... not so much.

You can take a look at this commit:

e2daec488c57 ("nbd: Fix hungtask when nbd_config_put")

Allocation of recv_workq is moved from start device to alloc device to
fix hungtask. You might need to be careful if you want to move this.

Thanks,
Kuai
> 
>        	       	    	  	  	    	     		Pavel
> 

