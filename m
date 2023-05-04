Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 105A86F7635
	for <lists+nbd@lfdr.de>; Thu,  4 May 2023 22:06:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E794520556; Thu,  4 May 2023 20:06:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu May  4 20:06:12 2023
Old-Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDO_WHITELIST,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_MED,T_SCC_BODY_TEXT_LINE
	autolearn=unavailable autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BCA1B20752
	for <lists-other-nbd@bendel.debian.org>; Thu,  4 May 2023 19:48:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-9.651 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.161,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, LDO_WHITELIST=-5, MD5_SHA1_SUM=-1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_MED=-2.3,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 4VL_PmMjBnTE for <lists-other-nbd@bendel.debian.org>;
	Thu,  4 May 2023 19:48:35 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B9B9D20744
	for <nbd@other.debian.org>; Thu,  4 May 2023 19:48:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D44D463730;
	Thu,  4 May 2023 19:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61134C433D2;
	Thu,  4 May 2023 19:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683229684;
	bh=SV/TzqWc1Kjj3tGSHgeGLWFhf+071zfE4hkgxdfP0YA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q/CprtiD/ZbfQhy6q9rkK9OXD7vfj7BNRNvpTI4qJzXvqZt9S8MsAB69Q0XRNMWIH
	 dqhKOnHkFAZrE56TPBYKbmJ2Pm7tlFi8ZEN1e+xi9gXizO8kWLEbSkf0j1leQxQEPK
	 xiCS60jhuDx4fbpnF3WrL7wq1BN3Pg9KUXKj/7TnMwstsvDHI5gSXrYpX77EBSmX78
	 23L5BGIGz6o4oCEtC0VnKeXY1tm1gz6VWpIrCmEgdVEQhOLNRWTpUbxoUyRenbuJAl
	 5OYtBgp7nvLpmUspu/XE5g/T4lD7kcygDiq3UrKzJRF9f5BYdHnb77bvOj0W7sXnIL
	 rUxcl9MZVjPKw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zhong Jinghua <zhongjinghua@huawei.com>,
	Yu Kuai <yukuai3@huawei.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Sasha Levin <sashal@kernel.org>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org
Subject: [PATCH AUTOSEL 6.1 38/49] nbd: fix incomplete validation of ioctl arg
Date: Thu,  4 May 2023 15:46:15 -0400
Message-Id: <20230504194626.3807438-38-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194626.3807438-1-sashal@kernel.org>
References: <20230504194626.3807438-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <c5UtaORBwlP.A.ia.0ABVkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2462
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20230504194626.3807438-38-sashal@kernel.org
Resent-Date: Thu,  4 May 2023 20:06:12 +0000 (UTC)

From: Zhong Jinghua <zhongjinghua@huawei.com>

[ Upstream commit 55793ea54d77719a071b1ccc05a05056e3b5e009 ]

We tested and found an alarm caused by nbd_ioctl arg without verification.
The UBSAN warning calltrace like below:

UBSAN: Undefined behaviour in fs/buffer.c:1709:35
signed integer overflow:
-9223372036854775808 - 1 cannot be represented in type 'long long int'
CPU: 3 PID: 2523 Comm: syz-executor.0 Not tainted 4.19.90 #1
Hardware name: linux,dummy-virt (DT)
Call trace:
 dump_backtrace+0x0/0x3f0 arch/arm64/kernel/time.c:78
 show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x170/0x1dc lib/dump_stack.c:118
 ubsan_epilogue+0x18/0xb4 lib/ubsan.c:161
 handle_overflow+0x188/0x1dc lib/ubsan.c:192
 __ubsan_handle_sub_overflow+0x34/0x44 lib/ubsan.c:206
 __block_write_full_page+0x94c/0xa20 fs/buffer.c:1709
 block_write_full_page+0x1f0/0x280 fs/buffer.c:2934
 blkdev_writepage+0x34/0x40 fs/block_dev.c:607
 __writepage+0x68/0xe8 mm/page-writeback.c:2305
 write_cache_pages+0x44c/0xc70 mm/page-writeback.c:2240
 generic_writepages+0xdc/0x148 mm/page-writeback.c:2329
 blkdev_writepages+0x2c/0x38 fs/block_dev.c:2114
 do_writepages+0xd4/0x250 mm/page-writeback.c:2344

The reason for triggering this warning is __block_write_full_page()
-> i_size_read(inode) - 1 overflow.
inode->i_size is assigned in __nbd_ioctl() -> nbd_set_size() -> bytesize.
We think it is necessary to limit the size of arg to prevent errors.

Moreover, __nbd_ioctl() -> nbd_add_socket(), arg will be cast to int.
Assuming the value of arg is 0x80000000000000001) (on a 64-bit machine),
it will become 1 after the coercion, which will return unexpected results.

Fix it by adding checks to prevent passing in too large numbers.

Signed-off-by: Zhong Jinghua <zhongjinghua@huawei.com>
Reviewed-by: Yu Kuai <yukuai3@huawei.com>
Reviewed-by: Josef Bacik <josef@toxicpanda.com>
Link: https://lore.kernel.org/r/20230206145805.2645671-1-zhongjinghua@huawei.com
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index e379ccc63c520..888a6abb50f53 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -325,6 +325,9 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 	if (blk_validate_block_size(blksize))
 		return -EINVAL;
 
+	if (bytesize < 0)
+		return -EINVAL;
+
 	nbd->config->bytesize = bytesize;
 	nbd->config->blksize_bits = __ffs(blksize);
 
@@ -1110,6 +1113,9 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	struct nbd_sock *nsock;
 	int err;
 
+	/* Arg will be cast to int, check it to avoid overflow */
+	if (arg > INT_MAX)
+		return -EINVAL;
 	sock = nbd_get_socket(nbd, arg, &err);
 	if (!sock)
 		return err;
-- 
2.39.2

