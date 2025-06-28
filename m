Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75EAEC3B9
	for <lists+nbd@lfdr.de>; Sat, 28 Jun 2025 03:06:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 03A0B205D5; Sat, 28 Jun 2025 01:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Sat Jun 28 01:06:11 2025
Old-Return-Path: <yukuai1@huaweicloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=4.0 tests=CC_TOO_MANY,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id A60A32058D
	for <lists-other-nbd@bendel.debian.org>; Sat, 28 Jun 2025 00:48:48 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.478 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, MIME_CHARSET_FARAWAY=0.02,
	NICE_REPLY_A=-1.201, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=0.001,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 7TV1wph_GOZJ for <lists-other-nbd@bendel.debian.org>;
	Sat, 28 Jun 2025 00:48:42 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 2FFB42056C
	for <nbd@other.debian.org>; Sat, 28 Jun 2025 00:48:41 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4bTYh62QTrzYQv8x
	for <nbd@other.debian.org>; Sat, 28 Jun 2025 08:48:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 3A55A1A07BD
	for <nbd@other.debian.org>; Sat, 28 Jun 2025 08:48:37 +0800 (CST)
Received: from [10.174.179.143] (unknown [10.174.179.143])
	by APP4 (Coremail) with SMTP id gCh0CgBXvGDhO19oJp97Qw--.50612S3;
	Sat, 28 Jun 2025 08:48:35 +0800 (CST)
Subject: Re: [PATCH] nbd: fix false lockdep deadlock warning
To: Ming Lei <ming.lei@redhat.com>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
 nilay@linux.ibm.com, hare@suse.de, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kernel@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, johnny.chenyi@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20250627092348.1527323-1-yukuai1@huaweicloud.com>
 <aF56oVEzTygIOUTN@fedora>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <c2fbaacc-62a1-4a98-4157-2637b7f242b7@huaweicloud.com>
Date: Sat, 28 Jun 2025 08:48:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <aF56oVEzTygIOUTN@fedora>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgBXvGDhO19oJp97Qw--.50612S3
X-Coremail-Antispam: 1UD129KBjvdXoWrAw1fCFWrGr17JF43Zw1UKFg_yoWxGwc_u3
	WS9a40gr1jyrZ0y3s7Kwn7CrnrWw1xKFykJr40yr1xWr13X3yfK3yDGa45Xr1DXa1xuw1q
	vr9rCw4Igr1SgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <AJoxWXzIN9O.A.xBcO.DA0XoB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3396
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/c2fbaacc-62a1-4a98-4157-2637b7f242b7@huaweicloud.com
Resent-Date: Sat, 28 Jun 2025 01:06:12 +0000 (UTC)

Hi,

ÔÚ 2025/06/27 19:04, Ming Lei Ð´µÀ:
> I guess the patch in the following link may be simper, both two take
> similar approach:
> 
> https://lore.kernel.org/linux-block/aFjbavzLAFO0Q7n1@fedora/

I this the above approach has concurrent problems if nbd_start_device
concurrent with nbd_start_device:

t1:
nbd_start_device
lock
num_connections = 1
unlock
	t2:
	nbd_add_socket
	lock
	config->num_connections++
	unlock
		t3:
		nbd_start_device
		lock
		num_connections = 2
		unlock
		blk_mq_update_nr_hw_queues

blk_mq_update_nr_hw_queues
//nr_hw_queues updated to 1 before failure
return -EINVAL

Thanks,
Kuai

