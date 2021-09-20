Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAFD412981
	for <lists+nbd@lfdr.de>; Tue, 21 Sep 2021 01:42:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 1E55420FA7; Mon, 20 Sep 2021 23:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 20 23:42:10 2021
Old-Return-Path: <3ehhJYQwKA98OEFTBVMOJFSTHPPHMF.DPNOCEPUIFS.EFCJBO.PSH@flex--ndesaulniers.bounces.google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FVGT_m_MULTI_ODD,MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id C5BE320976
	for <lists-other-nbd@bendel.debian.org>; Mon, 20 Sep 2021 23:25:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-6.661 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FVGT_m_MULTI_ODD=0.02,
	MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	USER_IN_DEF_DKIM_WL=-7.5] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id NHTHDWC0u4av for <lists-other-nbd@bendel.debian.org>;
	Mon, 20 Sep 2021 23:25:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .google. - helo: .mail-qk1-x74a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2 RANDOM_SENDER=0.25; rate: -5.25
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id D78D720F1D
	for <nbd@other.debian.org>; Mon, 20 Sep 2021 23:25:50 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id h10-20020a05620a284a00b003d30e8c8cb5so155082583qkp.11
        for <nbd@other.debian.org>; Mon, 20 Sep 2021 16:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=pguml3paj2LeB5heWrEsmrwhMCMlKDyRkBgZeHcvxlM=;
        b=QZvWuxoHRNl58kiylK3SiDmPeerQVYX1bUDQBZvz+VKz1OMGl/VnuqM0ABNzQDb6Ks
         /8L5utuNlUXChpYBFhNF2j+HVg1mUtaSM1C++icVmp55GCqaiFMAekzxaXp7yLULEBqL
         B2M3VblthoUdv+c424XdVu3PIbqROYvkP6q636u4C/xksk7EMrpPw9C629VarSo0IUgj
         bWWo3JG1sp5xNKkdMuAr9md9rg4qE/dxFKhz5Si/8nKiCl82o2FbENB0TMZLhDtZZBD8
         bjh175RLHfVQLJIWq9UxDARd2i3adArN3u2WB+UH6d3D2QhVW5wM6mD6Cm5Gc74zLwbI
         Zclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=pguml3paj2LeB5heWrEsmrwhMCMlKDyRkBgZeHcvxlM=;
        b=xnKWeX0qGrkU9lG3LnrDeBZsY+9hJDTE1PdxmzG3bdHstSEFw1BDLi10KFQm5MCuEf
         whi+3S6hlxeIMY+ELeEVMQnb6PEJjbQD7vS/vpp1P6IRm3kUZMWZowFyddGAv0QRu+vq
         WuIhtL5nnYx+TL91It0CLvKk0vWaIGjHU/lonUA2smK/xdjfXoxeVYAi2KVA6FHDj3Ah
         Ze9UWXrrE7HCOH3o+ZspV4aCFC669wagWArDdjYVlLDcipTdgPANJd5mMtojGIIhi8GH
         gmD3iinY4imOiXlKXflzGmEbazvUPZ198ZO2y1bhjwkq9R0Excdzj4YL4/0dVBltoTP6
         qg4w==
X-Gm-Message-State: AOAM530Uoo6CrequWpsqTh8reHpZNyVB8wrkSqk482Ansj31AcU8jO7i
	uN7aaycDJt894Iv8QTS9xwKcyvUAUvkIC3kXXlU=
X-Google-Smtp-Source: ABdhPJynuijKVoLP4/VxFshGz4xzdVcUOFIM1JQUgfFc54WcKcKHkKbKBrxx0Jq/2ZeuvyKmn4VSCDiGwarRap9I62E=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:5f32:153:b2ea:296d])
 (user=ndesaulniers job=sendgmr) by 2002:a25:1388:: with SMTP id
 130mr33364420ybt.58.1632180346968; Mon, 20 Sep 2021 16:25:46 -0700 (PDT)
Date: Mon, 20 Sep 2021 16:25:33 -0700
Message-Id: <20210920232533.4092046-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH] nbd: use shifts rather than multiplies
From: Nick Desaulniers <ndesaulniers@google.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	stable@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Kees Cook <keescook@chromium.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Pavel Machek <pavel@ucw.cz>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	nbd@other.debian.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <S_AVkVZUUOL.A.nRH.SxRShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1514
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210920232533.4092046-1-ndesaulniers@google.com
Resent-Date: Mon, 20 Sep 2021 23:42:10 +0000 (UTC)

commit fad7cd3310db ("nbd: add the check to prevent overflow in
__nbd_ioctl()") raised an issue from the fallback helpers added in
commit f0907827a8a9 ("compiler.h: enable builtin overflow checkers and
add fallback code")

ERROR: modpost: "__divdi3" [drivers/block/nbd.ko] undefined!

As Stephen Rothwell notes:
  The added check_mul_overflow() call is being passed 64 bit values.
  COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW is not set for this build (see
  include/linux/overflow.h).

Specifically, the helpers for checking whether the results of a
multiplication overflowed (__unsigned_mul_overflow,
__signed_add_overflow) use the division operator when
!COMPILER_HAS_GENERIC_BUILTIN_OVERFLOW.  This is problematic for 64b
operands on 32b hosts.

This was fixed upstream by
commit 76ae847497bc ("Documentation: raise minimum supported version of
GCC to 5.1")
which is not suitable to be backported to stable.

Further, __builtin_mul_overflow() would emit a libcall to a
compiler-rt-only symbol when compiling with clang < 14 for 32b targets.

ld.lld: error: undefined symbol: __mulodi4

In order to keep stable buildable with GCC 4.9 and clang < 14, modify
struct nbd_config to instead track the number of bits of the block size;
reconstructing the block size using runtime checked shifts that are not
problematic for those compilers and in a ways that can be backported to
stable.

In nbd_set_size, we do validate that the value of blksize must be a
power of two (POT) and is in the range of [512, PAGE_SIZE] (both
inclusive).

This does modify the debugfs interface.

Cc: stable@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Link: https://github.com/ClangBuiltLinux/linux/issues/1438
Link: https://lore.kernel.org/all/20210909182525.372ee687@canb.auug.org.au/
Link: https://lore.kernel.org/stable/CAHk-=whiQBofgis_rkniz8GBP9wZtSZdcDEffgSLO62BUGV3gg@mail.gmail.com/
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Suggested-by: Kees Cook <keescook@chromium.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
This patch is kind of a v3 for solving this problem.
v2: https://lore.kernel.org/stable/20210914002318.2298583-1-ndesaulniers@google.com/
v1: https://lore.kernel.org/stable/20210913203201.1844253-1-ndesaulniers@google.com/
But is quite different in approach. Instead of trying to fix up the
overflow routines in stable, we amend the code in nbd.c as per Linus
(against mainline) with fixes from Kees to use the named overflow
checker.

 drivers/block/nbd.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..1183f7872b71 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -97,13 +97,18 @@ struct nbd_config {
 
 	atomic_t recv_threads;
 	wait_queue_head_t recv_wq;
-	loff_t blksize;
+	unsigned int blksize_bits;
 	loff_t bytesize;
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *dbg_dir;
 #endif
 };
 
+static inline unsigned int nbd_blksize(struct nbd_config *config)
+{
+	return 1u << config->blksize_bits;
+}
+
 struct nbd_device {
 	struct blk_mq_tag_set tag_set;
 
@@ -146,7 +151,7 @@ static struct dentry *nbd_dbg_dir;
 
 #define NBD_MAGIC 0x68797548
 
-#define NBD_DEF_BLKSIZE 1024
+#define NBD_DEF_BLKSIZE_BITS 10
 
 static unsigned int nbds_max = 16;
 static int max_part = 16;
@@ -317,12 +322,12 @@ static int nbd_set_size(struct nbd_device *nbd, loff_t bytesize,
 		loff_t blksize)
 {
 	if (!blksize)
-		blksize = NBD_DEF_BLKSIZE;
+		blksize = 1u << NBD_DEF_BLKSIZE_BITS;
 	if (blksize < 512 || blksize > PAGE_SIZE || !is_power_of_2(blksize))
 		return -EINVAL;
 
 	nbd->config->bytesize = bytesize;
-	nbd->config->blksize = blksize;
+	nbd->config->blksize_bits = __ffs(blksize);
 
 	if (!nbd->task_recv)
 		return 0;
@@ -1337,7 +1342,7 @@ static int nbd_start_device(struct nbd_device *nbd)
 		args->index = i;
 		queue_work(nbd->recv_workq, &args->work);
 	}
-	return nbd_set_size(nbd, config->bytesize, config->blksize);
+	return nbd_set_size(nbd, config->bytesize, nbd_blksize(config));
 }
 
 static int nbd_start_device_ioctl(struct nbd_device *nbd, struct block_device *bdev)
@@ -1406,11 +1411,11 @@ static int __nbd_ioctl(struct block_device *bdev, struct nbd_device *nbd,
 	case NBD_SET_BLKSIZE:
 		return nbd_set_size(nbd, config->bytesize, arg);
 	case NBD_SET_SIZE:
-		return nbd_set_size(nbd, arg, config->blksize);
+		return nbd_set_size(nbd, arg, nbd_blksize(config));
 	case NBD_SET_SIZE_BLOCKS:
-		if (check_mul_overflow((loff_t)arg, config->blksize, &bytesize))
+		if (check_shl_overflow(arg, config->blksize_bits, &bytesize))
 			return -EINVAL;
-		return nbd_set_size(nbd, bytesize, config->blksize);
+		return nbd_set_size(nbd, bytesize, nbd_blksize(config));
 	case NBD_SET_TIMEOUT:
 		nbd_set_cmd_timeout(nbd, arg);
 		return 0;
@@ -1476,7 +1481,7 @@ static struct nbd_config *nbd_alloc_config(void)
 	atomic_set(&config->recv_threads, 0);
 	init_waitqueue_head(&config->recv_wq);
 	init_waitqueue_head(&config->conn_wait);
-	config->blksize = NBD_DEF_BLKSIZE;
+	config->blksize_bits = NBD_DEF_BLKSIZE_BITS;
 	atomic_set(&config->live_connections, 0);
 	try_module_get(THIS_MODULE);
 	return config;
@@ -1604,7 +1609,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
 	debugfs_create_file("tasks", 0444, dir, nbd, &nbd_dbg_tasks_fops);
 	debugfs_create_u64("size_bytes", 0444, dir, &config->bytesize);
 	debugfs_create_u32("timeout", 0444, dir, &nbd->tag_set.timeout);
-	debugfs_create_u64("blocksize", 0444, dir, &config->blksize);
+	debugfs_create_u32("blocksize_bits", 0444, dir, &config->blksize_bits);
 	debugfs_create_file("flags", 0444, dir, nbd, &nbd_dbg_flags_fops);
 
 	return 0;
@@ -1826,7 +1831,7 @@ nbd_device_policy[NBD_DEVICE_ATTR_MAX + 1] = {
 static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 {
 	struct nbd_config *config = nbd->config;
-	u64 bsize = config->blksize;
+	u64 bsize = nbd_blksize(config);
 	u64 bytes = config->bytesize;
 
 	if (info->attrs[NBD_ATTR_SIZE_BYTES])
@@ -1835,7 +1840,7 @@ static int nbd_genl_size_set(struct genl_info *info, struct nbd_device *nbd)
 	if (info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES])
 		bsize = nla_get_u64(info->attrs[NBD_ATTR_BLOCK_SIZE_BYTES]);
 
-	if (bytes != config->bytesize || bsize != config->blksize)
+	if (bytes != config->bytesize || bsize != nbd_blksize(config))
 		return nbd_set_size(nbd, bytes, bsize);
 	return 0;
 }

base-commit: 4c17ca27923c16fd73bbb9ad033c7d749c3bcfcc
-- 
2.33.0.464.g1972c5931b-goog

