Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A746F8678
	for <lists+nbd@lfdr.de>; Fri,  5 May 2023 18:15:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 9EE4C207FF; Fri,  5 May 2023 16:15:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri May  5 16:15:13 2023
Old-Return-Path: <01010187ec94d83c-45601ead-44a0-4bfb-813f-17b6201408dd-000000@us-west-2.amazonses.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=4.0 tests=DIGITS_LETTERS,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8A0B220562
	for <lists-other-nbd@bendel.debian.org>; Fri,  5 May 2023 15:57:36 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.46 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_INVALID=0.1,
	DKIM_SIGNED=0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=2,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	T_SCC_BODY_TEXT_LINE=-0.01] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Dt5F3oDbJbsT for <lists-other-nbd@bendel.debian.org>;
	Fri,  5 May 2023 15:57:28 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 852 seconds by postgrey-1.36 at bendel; Fri, 05 May 2023 15:57:27 UTC
Received: from a86-63.smtp-out.us-west-2.amazonses.com (a86-63.smtp-out.us-west-2.amazonses.com [54.240.86.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by bendel.debian.org (Postfix) with ESMTPS id B83A620523
	for <nbd@other.debian.org>; Fri,  5 May 2023 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1683301390;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type:Feedback-ID;
	bh=3Xb/BwFoW3TsEx0XrVs5JPaiUP7YujvmJbUkt1KKt4Q=;
	b=XARyursGeFBHMz/xCE6eKQRzDv+ZiFqOyKYmb/yT6m556IcWiJvG/x2NxuIVoNq3
	z9VV3datjAUUgYw4I/N+tBKe/omLuYkK4GQDm0F0hGKNxR0HW1wpGuST3LlMKVV3TUb
	dWU39xZpGIovmLg18LTe2sQXa3SZCdC7eoIx7JuM=
From: ticketsupport@incontactemail.com
Date: Fri, 5 May 2023 15:43:10 +0000
Subject: RE: [PATCH AUTOSEL 6.1 38/49] nbd: fix incomplete validation of ioctl
 arg
Message-ID: <01010187ec94d83c-45601ead-44a0-4bfb-813f-17b6201408dd-000000@us-west-2.amazonses.com>
To: sashal@kernel.org
Cc: zhongjinghua@huawei.com, yukuai3@huawei.com, josef@toxicpanda.com,
 axboe@kernel.dk, sashal@kernel.org, linux-block@vger.kernel.org,
 nbd@other.debian.org
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary=part_d4a0a875_c66b_4eb6_9dd7_a4a9a46d2e46
Feedback-ID: 1.us-west-2.xgvvsEBmNFCPGQycQIp2ohiutGFA7Wl3Wx4Y99itgcM=:AmazonSES
X-SES-Outgoing: 2023.05.05-54.240.86.63
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <qJA4DK2DbM.A.2JB.RuSVkB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2464
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/01010187ec94d83c-45601ead-44a0-4bfb-813f-17b6201408dd-000000@us-west-2.amazonses.com
Resent-Date: Fri,  5 May 2023 16:15:13 +0000 (UTC)

--part_d4a0a875_c66b_4eb6_9dd7_a4a9a46d2e46
Content-Type: text/plain; charset=utf-8

From: sashal@kernel.org Sent: Thu May 04 2023 14:46:15 GMT-0500 (Central Daylight Time) To: linux-kernel@vger.kernel.org;stable@vger.kernel.org CC: zhongjinghua@huawei.com;yukuai3@huawei.com;josef@toxicpanda.com;axboe@kernel.dk;sashal@kernel.org;linux-block@vger.kernel.org;nbd@other.debian.org Subject: [PATCH AUTOSEL 6.1 38/49] nbd: fix incomplete validation of ioctl arg 
From: Zhong Jinghua &lt;zhongjinghua@huawei.com&gt;[ Upstream commit 55793ea54d77719a071b1ccc05a05056e3b5e009 ]We tested and found an alarm caused by nbd_ioctl arg without verification.The UBSAN warning calltrace like below:UBSAN: Undefined behaviour in fs/buffer.c:1709:35signed integer overflow:-9223372036854775808 - 1 cannot be represented in type 'long long int'CPU: 3 PID: 2523 Comm: syz-executor.0 Not tainted 4.19.90 #1Hardware name: linux,dummy-virt (DT)Call trace:dump_backtrace+0x0/0x3f0 arch/arm64/kernel/time.c:78show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158__dump_stack lib/dump_stack.c:77 [inline]dump_stack+0x170/0x1dc lib/dump_stack.c:118ubsan_epilogue+0x18/0xb4 lib/ubsan.c:161handle_overflow+0x188/0x1dc lib/ubsan.c:192__ubsan_handle_sub_overflow+0x34/0x44 lib/ubsan.c:206__block_write_full_page+0x94c/0xa20 fs/buffer.c:1709block_write_full_page+0x1f0/0x280 fs/buffer.c:2934blkdev_writepage+0x34/0x40 fs/block_dev.c:607__writepage+0x68/0xe8 mm/page-writeback.c:2305write_cac
 he_pages+0x44c/0xc70 mm/page-writeback.c:2240generic_writepages+0xdc/0x148 mm/page-writeback.c:2329blkdev_writepages+0x2c/0x38 fs/block_dev.c:2114do_writepages+0xd4/0x250 mm/page-writeback.c:2344The reason for triggering this warning is __block_write_full_page()-&gt; i_size_read(inode) - 1 overflow.inode-&gt;i_size is assigned in __nbd_ioctl() -&gt; nbd_set_size() -&gt; bytesize.We think it is necessary to limit the size of arg to prevent errors.Moreover, __nbd_ioctl() -&gt; nbd_add_socket(), arg will be cast to int.Assuming the value of arg is 0x80000000000000001) (on a 64-bit machine),it will become 1 after the coercion, which will return unexpected results.Fix it by adding checks to prevent passing in too large numbers.Signed-off-by: Zhong Jinghua &lt;zhongjinghua@huawei.com&gt;Reviewed-by: Yu Kuai &lt;yukuai3@huawei.com&gt;Reviewed-by: Josef Bacik &lt;josef@toxicpanda.com&gt;Link: https://lore.kernel.org/r/20230206145805.2645671-1-zhongjinghua@huawei.comSigned-off-by: Jens Axboe
  &lt;axboe@kernel.dk&gt;Signed-off-by: Sasha Levin &lt;sashal@kernel.org&gt;---drivers/block/nbd.c | 6 ++++++1 file changed, 6 insertions(+)diff --git a/drivers/block/nbd.c b/drivers/block/nbd.cindex e379ccc63c520..888a6abb50f53 100644--- a/drivers/block/nbd.c+++ b/drivers/block/nbd.c@@ -325,6 +325,9 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,\tif (blk_validate_block_size(blksize))\t\treturn -EINVAL;+\tif (bytesize &lt; 0)+\t\treturn -EINVAL;+\tnbd-&gt;config-&gt;bytesize = bytesize;\tnbd-&gt;config-&gt;blksize_bits = __ffs(blksize);@@ -1110,6 +1113,9 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,\tstruct nbd_sock *nsock;\tint err;+\t/* Arg will be cast to int, check it to avoid overflow */+\tif (arg &gt; INT_MAX)+\t\treturn -EINVAL;\tsock = nbd_get_socket(nbd, arg, &amp;err);\tif (!sock)\t\treturn err;-- 2.39.2&lt;/sashal@kernel.org&gt;&lt;/axboe@kernel.dk&gt;&lt;/josef@toxicpanda.com&gt;&lt;/yukuai3@huawei.com&gt;&lt;/zhongjinghua@h
 uawei.com&gt;&lt;/zhongjinghua@huawei.com&gt;
--part_d4a0a875_c66b_4eb6_9dd7_a4a9a46d2e46
Content-Type: text/html; charset=utf-8
Content-Id: <MXX22W24VJU4.OSEINEGSODP2@send-email-api>

<div><br /><hr />From: sashal@kernel.org <br />Sent: Thu May 04 2023 14:46:15 GMT-0500 (Central Daylight Time) <br />To: linux-kernel@vger.kernel.org;stable@vger.kernel.org <br />CC: zhongjinghua@huawei.com;yukuai3@huawei.com;josef@toxicpanda.com;axboe@kernel.dk;sashal@kernel.org;linux-block@vger.kernel.org;nbd@other.debian.org <br />Subject: [PATCH AUTOSEL 6.1 38/49] nbd: fix incomplete validation of ioctl arg </div>
From: Zhong Jinghua &lt;zhongjinghua@huawei.com&gt;<br /><br />[ Upstream commit 55793ea54d77719a071b1ccc05a05056e3b5e009 ]<br /><br />We tested and found an alarm caused by nbd_ioctl arg without verification.<br />The UBSAN warning calltrace like below:<br /><br />UBSAN: Undefined behaviour in fs/buffer.c:1709:35<br />signed integer overflow:<br />-9223372036854775808 - 1 cannot be represented in type 'long long int'<br />CPU: 3 PID: 2523 Comm: syz-executor.0 Not tainted 4.19.90 #1<br />Hardware name: linux,dummy-virt (DT)<br />Call trace:<br />dump_backtrace+0x0/0x3f0 arch/arm64/kernel/time.c:78<br />show_stack+0x28/0x38 arch/arm64/kernel/traps.c:158<br />__dump_stack lib/dump_stack.c:77 [inline]<br />dump_stack+0x170/0x1dc lib/dump_stack.c:118<br />ubsan_epilogue+0x18/0xb4 lib/ubsan.c:161<br />handle_overflow+0x188/0x1dc lib/ubsan.c:192<br />__ubsan_handle_sub_overflow+0x34/0x44 lib/ubsan.c:206<br />__block_write_full_page+0x94c/0xa20 fs/buffer.c:1709<br />block_write_full_page+0x
 1f0/0x280 fs/buffer.c:2934<br />blkdev_writepage+0x34/0x40 fs/block_dev.c:607<br />__writepage+0x68/0xe8 mm/page-writeback.c:2305<br />write_cache_pages+0x44c/0xc70 mm/page-writeback.c:2240<br />generic_writepages+0xdc/0x148 mm/page-writeback.c:2329<br />blkdev_writepages+0x2c/0x38 fs/block_dev.c:2114<br />do_writepages+0xd4/0x250 mm/page-writeback.c:2344<br /><br />The reason for triggering this warning is __block_write_full_page()<br />-&gt; i_size_read(inode) - 1 overflow.<br />inode-&gt;i_size is assigned in __nbd_ioctl() -&gt; nbd_set_size() -&gt; bytesize.<br />We think it is necessary to limit the size of arg to prevent errors.<br /><br />Moreover, __nbd_ioctl() -&gt; nbd_add_socket(), arg will be cast to int.<br />Assuming the value of arg is 0x80000000000000001) (on a 64-bit machine),<br />it will become 1 after the coercion, which will return unexpected results.<br /><br />Fix it by adding checks to prevent passing in too large numbers.<br /><br />Signed-off-by: Zhong Jing
 hua &lt;zhongjinghua@huawei.com&gt;<br />Reviewed-by: Yu Kuai &lt;yukuai3@huawei.com&gt;<br />Reviewed-by: Josef Bacik &lt;josef@toxicpanda.com&gt;<br />Link: https://lore.kernel.org/r/20230206145805.2645671-1-zhongjinghua@huawei.com<br />Signed-off-by: Jens Axboe &lt;axboe@kernel.dk&gt;<br />Signed-off-by: Sasha Levin &lt;sashal@kernel.org&gt;<br />---<br />drivers/block/nbd.c | 6 ++++++<br />1 file changed, 6 insertions(+)<br /><br />diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c<br />index e379ccc63c520..888a6abb50f53 100644<br />--- a/drivers/block/nbd.c<br />+++ b/drivers/block/nbd.c<br />@@ -325,6 +325,9 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,<br />\tif (blk_validate_block_size(blksize))<br />\t\treturn -EINVAL;<br /><br />+\tif (bytesize &lt; 0)<br />+\t\treturn -EINVAL;<br />+<br />\tnbd-&gt;config-&gt;bytesize = bytesize;<br />\tnbd-&gt;config-&gt;blksize_bits = __ffs(blksize);<br /><br />@@ -1110,6 +1113,9 @@ static int nbd_add_socket(st
 ruct nbd_device *nbd, unsigned long arg,<br />\tstruct nbd_sock *nsock;<br />\tint err;<br /><br />+\t/* Arg will be cast to int, check it to avoid overflow */<br />+\tif (arg &gt; INT_MAX)<br />+\t\treturn -EINVAL;<br />\tsock = nbd_get_socket(nbd, arg, &amp;err);<br />\tif (!sock)<br />\t\treturn err;<br />-- <br />2.39.2<br /><br />&lt;/sashal@kernel.org&gt;&lt;/axboe@kernel.dk&gt;&lt;/josef@toxicpanda.com&gt;&lt;/yukuai3@huawei.com&gt;&lt;/zhongjinghua@huawei.com&gt;&lt;/zhongjinghua@huawei.com&gt;
--part_d4a0a875_c66b_4eb6_9dd7_a4a9a46d2e46--

