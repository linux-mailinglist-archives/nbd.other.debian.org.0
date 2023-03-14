Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 524FD6B8BEB
	for <lists+nbd@lfdr.de>; Tue, 14 Mar 2023 08:27:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 22C052044C; Tue, 14 Mar 2023 07:27:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Mar 14 07:27:12 2023
Old-Return-Path: <zhongjinghua@huawei.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DIGITS_LETTERS,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 58342205AC
	for <lists-other-nbd@bendel.debian.org>; Tue, 14 Mar 2023 07:10:32 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.371 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3yMbvHCH-bhq for <lists-other-nbd@bendel.debian.org>;
	Tue, 14 Mar 2023 07:10:24 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .huawei. - helo: .szxga08-in.huawei. - helo-domain: .huawei.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id 799CB205AA
	for <nbd@other.debian.org>; Tue, 14 Mar 2023 07:10:22 +0000 (UTC)
Received: from kwepemm600002.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PbPjP2tr6z17Kmy;
	Tue, 14 Mar 2023 15:07:21 +0800 (CST)
Received: from [10.174.178.159] (10.174.178.159) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 15:10:16 +0800
Message-ID: <b191b5b0-1dd8-e36a-75b3-d47f0195ca48@huawei.com>
Date: Tue, 14 Mar 2023 15:10:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH-next] nbd: fix incomplete validation of ioctl arg
To: <josef@toxicpanda.com>, <axboe@kernel.dk>
CC: <linux-block@vger.kernel.org>, <nbd@other.debian.org>,
	<linux-kernel@vger.kernel.org>, <yi.zhang@huawei.com>, <yukuai3@huawei.com>,
	<houtao1@huawei.com>, <yangerkun@huawei.com>, Zhong Jinghua
	<zhongjinghua@huaweicloud.com>
References: <20230206145805.2645671-1-zhongjinghua@huawei.com>
From: zhongjinghua <zhongjinghua@huawei.com>
In-Reply-To: <20230206145805.2645671-1-zhongjinghua@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.159]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <W04N07bCxj.A.VSD.QHCEkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2388
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/b191b5b0-1dd8-e36a-75b3-d47f0195ca48@huawei.com
Resent-Date: Tue, 14 Mar 2023 07:27:12 +0000 (UTC)

ping...

Hello

Anyone looking this？

在 2023/2/6 22:58, Zhong Jinghua 写道:
> We tested and found an alarm caused by nbd_ioctl arg without verification.
> The UBSAN warning calltrace like below:
>
> UBSAN: Undefined behaviour in fs/buffer.c:1709:35
> signed integer overflow:
> -9223372036854775808 - 1 cannot be represented in type 'long long int'
> CPU: 3 PID: 2523 Comm: syz-executor.0 Not tainted 4.19.90 #1
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>   dump_backtrace+0x0/0x3f0 arch/arm64/kernel/time.c:78
>   show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0x170/0x1dc lib/dump_stack.c:118
>   ubsan_epilogue+0x18/0xb4 lib/ubsan.c:161
>   handle_overflow+0x188/0x1dc lib/ubsan.c:192
>   __ubsan_handle_sub_overflow+0x34/0x44 lib/ubsan.c:206
>   __block_write_full_page+0x94c/0xa20 fs/buffer.c:1709
>   block_write_full_page+0x1f0/0x280 fs/buffer.c:2934
>   blkdev_writepage+0x34/0x40 fs/block_dev.c:607
>   __writepage+0x68/0xe8 mm/page-writeback.c:2305
>   write_cache_pages+0x44c/0xc70 mm/page-writeback.c:2240
>   generic_writepages+0xdc/0x148 mm/page-writeback.c:2329
>   blkdev_writepages+0x2c/0x38 fs/block_dev.c:2114
>   do_writepages+0xd4/0x250 mm/page-writeback.c:2344
>
> The reason for triggering this warning is __block_write_full_page()
> -> i_size_read(inode) - 1 overflow.
> inode->i_size is assigned in __nbd_ioctl() -> nbd_set_size() -> bytesize.
> We think it is necessary to limit the size of arg to prevent errors.
>
> Moreover, __nbd_ioctl() -> nbd_add_socket(), arg will be cast to int.
> Assuming the value of arg is 0x80000000000000001) (on a 64-bit machine),
> it will become 1 after the coercion, which will return unexpected results.
>
> Fix it by adding checks to prevent passing in too large numbers.
>
> Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>
> ---
>   drivers/block/nbd.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 592cfa8b765a..e1c954094b6c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -325,6 +325,9 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
>   	if (blk_validate_block_size(blksize))
>   		return -EINVAL;
>   
> +	if (bytesize < 0)
> +		return -EINVAL;
> +
>   	nbd->config->bytesize = bytesize;
>   	nbd->config->blksize_bits = __ffs(blksize);
>   
> @@ -1111,6 +1114,9 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>   	struct nbd_sock *nsock;
>   	int err;
>   
> +	/* Arg will be cast to int, check it to avoid overflow */
> +	if (arg > INT_MAX)
> +		return -EINVAL;
>   	sock = nbd_get_socket(nbd, arg, &err);
>   	if (!sock)
>   		return err;

