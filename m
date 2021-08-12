Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8833EA213
	for <lists+nbd@lfdr.de>; Thu, 12 Aug 2021 11:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id CC2E020241; Thu, 12 Aug 2021 09:33:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Aug 12 09:33:09 2021
Old-Return-Path: <paskripkin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FREEMAIL_FROM,
	MD5_SHA1_SUM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4670F2035A
	for <lists-other-nbd@bendel.debian.org>; Thu, 12 Aug 2021 09:15:18 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id w_lkLQLU8JdZ for <lists-other-nbd@bendel.debian.org>;
	Thu, 12 Aug 2021 09:15:13 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4313420147
	for <nbd@other.debian.org>; Thu, 12 Aug 2021 09:15:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g13so12146187lfj.12
        for <nbd@other.debian.org>; Thu, 12 Aug 2021 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNZvgEwzNlv74EhPdPOrR7WRv0hD45zwdbp38WU3FKg=;
        b=h+hLzT97yAPBswp6hlz/ItmWV82FKo/j+KipuGYmmIkHRfMdCpQ4nRsjYf/G2s4IUg
         vqOnTqFl99HsyPm7PSqdTBXXD92aSpv/v99/qAlIHe/lwu7BiqG5hQKEej6P/b0T2NV4
         Udz6ivLrGOfK56DTIbmUd174WN8GtlnNBbxR8orB/XeIqCVgK3TtdHqCZ5GJr2LfmMCD
         7A6Wa7loVfIzoBSBXoYU7AHWix5PR28hudeN7AAJZIAZB5SBuDT52j8hI9mgDGC98C4j
         x9lIik0UvW9/+8AOxMk5NPWf6yTiSD1k8xc8iWBNi219thpwwFED9gL5D5F7jv8jnqKq
         hTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iNZvgEwzNlv74EhPdPOrR7WRv0hD45zwdbp38WU3FKg=;
        b=DET6/PCMdlYGX1NPdUpMCnxEq6EIQmAcuGPGe7DZC8aPAQuXN1jb65K/n0kp2ECQPN
         kmPM/puMovSAxjIr1waI3mFY8v7BQWCTBtMiXM83I9JTHpM3xEMSmIDmBlyu5Cr1bA7w
         0B1x1/him+InNNP3ccPIVGlVSJTI7J+/7LYi8fkVpyqP78HmdEk2tAEcLos73ooETTpv
         5KdaubPS7tDSdhOZ1pNBD1glazZKu19k4wE4LcEWMWwV1JyYft21/vqqqX3QXS172bb/
         +X5TF/oUStH1mDxgt0u/RooF7RBEHfUucki3+/1xdfPXJ/CfxNCzhxLwIeZk90z09/fn
         GJ/w==
X-Gm-Message-State: AOAM5305h2EugrB+BaGY1xru+U5IOETLHk9+fAyEw113HvmNEkzOwgjj
	OSM79qVZft5q1ITaOS+rrdk=
X-Google-Smtp-Source: ABdhPJxVB+cmqliIX3pFzzoc6Q63jgJhn4JTxvzkGi0+AkKwc7iI4rwUk/r3BxhQZ79Dfg7ticWITQ==
X-Received: by 2002:ac2:4e8c:: with SMTP id o12mr1925327lfr.374.1628759706519;
        Thu, 12 Aug 2021 02:15:06 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.232])
        by smtp.gmail.com with ESMTPSA id q66sm246264ljb.83.2021.08.12.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 02:15:06 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: hch@lst.de,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
Subject: [PATCH] block: nbd: add sanity check for first_minor
Date: Thu, 12 Aug 2021 12:15:01 +0300
Message-Id: <20210812091501.22648-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <CZL9vsv8YMN.A.HrG.VrOFhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1273
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210812091501.22648-1-paskripkin@gmail.com
Resent-Date: Thu, 12 Aug 2021 09:33:09 +0000 (UTC)

Syzbot hit WARNING in internal_create_group(). The problem was in
too big disk->first_minor.

disk->first_minor is initialized by value, which comes from userspace
and there wasn't any sanity checks about value correctness. It can cause
duplicate creation of sysfs files/links, because disk->first_minor will
be passed to MKDEV() which causes truncation to byte. Since maximum
minor value is 0xff, let's check if first_minor is correct minor number.

NOTE: the root case of the reported warning was in wrong error handling
in register_disk(), but we can avoid passing knowingly wrong values to
sysfs API, because sysfs error messages can confuse users. For example:
user passed 1048576 as index, but sysfs complains about duplicate
creation of /dev/block/43:0. It's not obvious how 1048576 becomes 0.
Log and reproducer for above example can be found on syzkaller bug
report page.

Link: https://syzkaller.appspot.com/bug?id=03c2ae9146416edf811958d5fd7acfab75b143d1
Fixes: b0d9111a2d53 ("nbd: use an idr to keep track of nbd devices")
Reported-by: syzbot+9937dc42271cd87d4b98@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/block/nbd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index c38317979f74..600e9bab5d43 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1725,7 +1725,17 @@ static int nbd_dev_add(int index)
 	refcount_set(&nbd->refs, 1);
 	INIT_LIST_HEAD(&nbd->list);
 	disk->major = NBD_MAJOR;
+
+	/* Too big first_minor can cause duplicate creation of
+	 * sysfs files/links, since first_minor will be truncated to
+	 * byte in __device_add_disk().
+	 */
 	disk->first_minor = index << part_shift;
+	if (disk->first_minor > 0xff) {
+		err = -EINVAL;
+		goto out_free_idr;
+	}
+
 	disk->minors = 1 << part_shift;
 	disk->fops = &nbd_fops;
 	disk->private_data = nbd;
-- 
2.32.0

