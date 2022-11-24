Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F036377B8
	for <lists+nbd@lfdr.de>; Thu, 24 Nov 2022 12:33:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 523F020481; Thu, 24 Nov 2022 11:33:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Nov 24 11:33:19 2022
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=4.0 tests=NICE_REPLY_A,RDNS_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 3EFD420430
	for <lists-other-nbd@bendel.debian.org>; Thu, 24 Nov 2022 11:17:21 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.208 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, NICE_REPLY_A=-0.001, RDNS_NONE=0.793]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kywMFWv8mV_e for <lists-other-nbd@bendel.debian.org>;
	Thu, 24 Nov 2022 11:17:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id A689420437
	for <nbd@other.debian.org>; Thu, 24 Nov 2022 11:17:13 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4NHwSJ17rFz4f3jqW
	for <nbd@other.debian.org>; Thu, 24 Nov 2022 19:17:04 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP4 (Coremail) with SMTP id gCh0CgDH69ixUn9jsjZLBA--.43973S3;
	Thu, 24 Nov 2022 19:17:07 +0800 (CST)
Subject: Re: nbd: please don't spawn 16 threads when nbd is not even in use
To: Pavel Machek <pavel@ucw.cz>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: Eric Blake <eblake@redhat.com>, kernel list
 <linux-kernel@vger.kernel.org>, josef@toxicpanda.com,
 linux-block@vger.kernel.org, nbd@other.debian.org,
 "yukuai (C)" <yukuai3@huawei.com>
References: <Y3y4+QqOlF00X9ET@duo.ucw.cz>
 <20221123200845.cuct5euvikqksojm@redhat.com> <Y36YHNVmbozzSdxH@duo.ucw.cz>
 <ccee0ff5-309c-b430-09c7-8d2081c9981d@huaweicloud.com>
 <Y39CFnRwNGBGIsCH@duo.ucw.cz>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <f07f496d-3bf7-eb84-eb90-df2d43c5c01b@huaweicloud.com>
Date: Thu, 24 Nov 2022 19:17:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <Y39CFnRwNGBGIsCH@duo.ucw.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgDH69ixUn9jsjZLBA--.43973S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYF7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2
	V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <7fnG7VuKVhM.A._HB._Z1fjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2307
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f07f496d-3bf7-eb84-eb90-df2d43c5c01b@huaweicloud.com
Resent-Date: Thu, 24 Nov 2022 11:33:19 +0000 (UTC)

Hi,

在 2022/11/24 18:06, Pavel Machek 写道:
> 
> Can we get that reverted?
> 
> That is rather obscure bug (how many GFP_KERNEL failures do you
> normally see?) and it costs, dunno, 100KB? of unswappable memory.
> 

No, I don't think that can be reverted. Introduce a BUG just to save
some memory sounds insane.

If you really want to do this. I think the right thing to do is to move
the allocation of recv_workq back to start device, and also fix the
problem properly.

Thanks,
Kuai
> Best regards,
> 								Pavel
> 

