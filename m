Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 640AEDF690
	for <lists+nbd@lfdr.de>; Mon, 21 Oct 2019 22:12:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2898D203B6; Mon, 21 Oct 2019 20:12:19 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Oct 21 20:12:19 2019
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 694B120363
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Oct 2019 19:56:42 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ycU2QzX1Oedv for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Oct 2019 19:56:38 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x742.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 12A9D2039B
	for <nbd@other.debian.org>; Mon, 21 Oct 2019 19:56:37 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id p4so13951710qkf.5
        for <nbd@other.debian.org>; Mon, 21 Oct 2019 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=olbMooGjFBayOK7jc5tAferY0kolRn7LFl7EO6n9+Nc=;
        b=2KVIdo4CnFZeezRJGdUURVYAxlQipkL+U3JQu19GH2FVPmUpW8jPkgNcp3A/FaenyN
         YpDIUISBLUO/+NfQpOynPtqRVUzgjeMb6JGpu3nAufBRVmlsqDu2Gnj1qhczeZX0IW+A
         CvdTsJBaFh/ytGNiETeuhrPHtWaI44lFx5DD/EjujMDDu3QpoL1iDFSJIIpESUEecBMb
         a66XPczNy+vrzshaqgkl5bSWZbiTNlSd+v3cv5tREpLsUw8/tiopaJU1VPrwDzu2hXn6
         0p7w0wNOgxCgzaqslc3rcBA7xzbtodnvQl6D28FMZBFtrugTXGfmbzMWwSk8l0NVaT1/
         qAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=olbMooGjFBayOK7jc5tAferY0kolRn7LFl7EO6n9+Nc=;
        b=Fn15Od02VnmYmInKEssuwdpYf5sazSvBGwBbYmetAOsd7wB2i/cly7/qW6vaDolDFR
         wZ2wvd6JarAPSuLQkSFuup1q7hPbFfrlPOeDmIZ7o/AzfFuLZStLCeH/vWna+Rb9fhjq
         RHE0UaXpvgEv4ghwxauLs0cj65Rpb4fZcoymWMWCvS+hFLnkvK7HRSsW/qo0m14Z+g9D
         8jYVKW+EPpVW8UXKAcGZ01GcNOPz1jnzyhvYuIaxfk42Ojba2pQfKkBEMPt7VFDbcHyP
         GzcwaAp+5fO6BC3BZN4WY0R/LTUa7h/tm8Zy4N6iQeopNlKyr617UqT4qU/qgQceuYmc
         CwgA==
X-Gm-Message-State: APjAAAV31dUOch53CiDwSuqIAtsR/T2JfrvLf6jCNqNa6jjczF9UD2Pf
	mb5PudykfCNwS2YKU5q5ggW/og==
X-Google-Smtp-Source: APXvYqynVLEZMpVVt7pXNA5sBJbHLg8xYpkuKPGZrIRVUI+mw+ub3JJnSUuMdGm6zJgRfz/ULG7k2Q==
X-Received: by 2002:a37:353:: with SMTP id 80mr23331009qkd.439.1571687794781;
        Mon, 21 Oct 2019 12:56:34 -0700 (PDT)
Received: from localhost ([107.15.81.208])
        by smtp.gmail.com with ESMTPSA id d2sm7734516qkj.123.2019.10.21.12.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 12:56:34 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: axboe@kernel.dk,
	nbd@other.debian.org,
	linux-block@vger.kernel.org,
	kernel-team@fb.com,
	mchristi@redhat.com
Subject: [PATCH 2/2] nbd: handle racing with error'ed out commands
Date: Mon, 21 Oct 2019 15:56:28 -0400
Message-Id: <20191021195628.19849-3-josef@toxicpanda.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191021195628.19849-1-josef@toxicpanda.com>
References: <20191021195628.19849-1-josef@toxicpanda.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <LTiwN_TRslH.A.EXE.jEhrdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/719
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20191021195628.19849-3-josef@toxicpanda.com
Resent-Date: Mon, 21 Oct 2019 20:12:19 +0000 (UTC)

We hit the following warning in production

print_req_error: I/O error, dev nbd0, sector 7213934408 flags 80700
------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: CPU: 25 PID: 32407 at lib/refcount.c:190 refcount_sub_and_test_checked+0x53/0x60
Workqueue: knbd-recv recv_work [nbd]
RIP: 0010:refcount_sub_and_test_checked+0x53/0x60
Call Trace:
 blk_mq_free_request+0xb7/0xf0
 blk_mq_complete_request+0x62/0xf0
 recv_work+0x29/0xa1 [nbd]
 process_one_work+0x1f5/0x3f0
 worker_thread+0x2d/0x3d0
 ? rescuer_thread+0x340/0x340
 kthread+0x111/0x130
 ? kthread_create_on_node+0x60/0x60
 ret_from_fork+0x1f/0x30
---[ end trace b079c3c67f98bb7c ]---

This was preceded by us timing out everything and shutting down the
sockets for the device.  The problem is we had a request in the queue at
the same time, so we completed the request twice.  This can actually
happen in a lot of cases, we fail to get a ref on our config, we only
have one connection and just error out the command, etc.

Fix this by checking cmd->status in nbd_read_stat.  We only change this
under the cmd->lock, so we are safe to check this here and see if we've
already error'ed this command out, which would indicate that we've
completed it as well.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 8fb8913074b8..e9f5d4e476e7 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -693,6 +693,12 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 		ret = -ENOENT;
 		goto out;
 	}
+	if (cmd->status != BLK_STS_OK) {
+		dev_err(disk_to_dev(nbd->disk), "Command already handled %p\n",
+			req);
+		ret = -ENOENT;
+		goto out;
+	}
 	if (test_bit(NBD_CMD_REQUEUED, &cmd->flags)) {
 		dev_err(disk_to_dev(nbd->disk), "Raced with timeout on req %p\n",
 			req);
-- 
2.21.0

