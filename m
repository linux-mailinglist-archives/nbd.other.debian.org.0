Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 859591A4672
	for <lists+nbd@lfdr.de>; Fri, 10 Apr 2020 14:45:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 621EA20520; Fri, 10 Apr 2020 12:45:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Apr 10 12:45:09 2020
Old-Return-Path: <dezgeg@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FOURLA,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 37B9520459
	for <lists-other-nbd@bendel.debian.org>; Fri, 10 Apr 2020 12:29:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.481 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
	HEADER_FROM_DIFFERENT_DOMAINS=0.249, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id ayrlLbAx3Mvn for <lists-other-nbd@bendel.debian.org>;
	Fri, 10 Apr 2020 12:29:26 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B085520446
	for <nbd@other.debian.org>; Fri, 10 Apr 2020 12:29:23 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s13so1244835lfb.9
        for <nbd@other.debian.org>; Fri, 10 Apr 2020 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=dyzXmKu6IT/Un75AvtMcFm0MmYMRWfAsrqCi/hItOfE=;
        b=dFATq6225UkB+ndW1q0MUtbxWax/bpYH/lVDUCCZoR/bytXFFKlAvqU0ogKu1vZkRm
         Z6XEBY73WGQruhzmC+P0je0W9srJO1Z6H90Agqn9j/HblTKoTAedwlex9pfEoXdektBt
         3WzuqQc6zlXYYXGFaYsi7xtfRtvltqXZKDzp8FcIldCIcbB1814nLAAkO43RlBgacEEh
         YLisjYAFkDbbqJ6j4J/cYb9EYVLwKzJZxbllMRaYEVwKD6xJvGwHhpm5Juy8lRMlCeeS
         3J6P5l+ycqOcAU+tLO6wBVUi5d+Au10o//CznthQiwSjQOmqC5w0eAyaypyjtstLY78I
         Zv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=dyzXmKu6IT/Un75AvtMcFm0MmYMRWfAsrqCi/hItOfE=;
        b=RpCS51gx2kVJY21eVRyL2pS8jzpxHoNu8KbgS8CDA5alUhYRk4dMnUfyAFuQrYsbIC
         54J8dIPLzIz1a93NdkeWpjiaZsITlRS6lMNhiETPAc9E6z1AL04P2EK/K2VmvhT7Lcr8
         hLbayVdapsQ0Brwtyf3m93xXT73WRSv4AGobnCcShmvhwVSEeggCUlgCupVh+B4vOk3q
         xBB7brNqRRAIuWWtD1XSzYCRxKld2FEieUJN8dMWRSY+dK9S30QFyMu/CCcbtFZWt5JN
         NooTs3pFCWP1e1emVDLHtyI6iemOSF/xbQ1QNeIjBvg5RALAdRQqI2nLApK5rdHRUaXm
         p1Wg==
X-Gm-Message-State: AGi0PualrYAP/jrS8msmiY67bDIajbokSz07hQAe6e+8x1lg0xB6JR1p
	41UcjAn7oknY5ymq84T22XY=
X-Google-Smtp-Source: APiQypJ59syTnwhr8k42RVJGDg6iEEJkC7GLZ1DlgJlnvdwUdJtTLQ/W3A8JB7VDaL0cqCJ4blofZA==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr2420626lfp.4.1586521760984;
        Fri, 10 Apr 2020 05:29:20 -0700 (PDT)
Received: from work.bb.dnainternet.fi (dffyyyyyyyyyyyysyd4py-3.rev.dnainternet.fi. [2001:14ba:2100::1e0:1e18])
        by smtp.gmail.com with ESMTPSA id x17sm1012977ljc.33.2020.04.10.05.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 05:29:20 -0700 (PDT)
Sender: Tuomas Tynkkynen <dezgeg@gmail.com>
From: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
To: axboe@kernel.dk,
	josef@toxicpanda.com
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	syzbot+934037347002901b8d2a@syzkaller.appspotmail.com,
	Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
	stable@kernel.org
Subject: [PATCH] nbd: Fix memory leak from krealloc() if another allocation fails
Date: Fri, 10 Apr 2020 15:29:13 +0300
Message-Id: <20200410122913.14339-1-tuomas.tynkkynen@iki.fi>
X-Mailer: git-send-email 2.17.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <cpEUKZQbCYK.A.tDH.VpGkeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/870
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200410122913.14339-1-tuomas.tynkkynen@iki.fi
Resent-Date: Fri, 10 Apr 2020 12:45:09 +0000 (UTC)

syzkaller reports a memory leak when injecting allocation failures:

FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 0
...
 kmem_cache_alloc_trace+0x26/0x2c0
 nbd_add_socket+0xa8/0x1e0
 nbd_ioctl+0x175/0x430
...
BUG: memory leak
    [<0000000090cb73c8>] __do_krealloc mm/slab_common.c:1671 [inline]
    [<0000000090cb73c8>] krealloc+0x7c/0xa0 mm/slab_common.c:1700
    [<00000000cf9e6ba7>] nbd_add_socket+0x7d/0x1e0 drivers/block/nbd.c:1040
    ...

This happens when krealloc() succeeds but the kzalloc() fails:
1040         socks = krealloc(config->socks, (config->num_connections + 1) *
1041                          sizeof(struct nbd_sock *), GFP_KERNEL);
1042         if (!socks) {
1043                 sockfd_put(sock);
1044                 return -ENOMEM;
1045         }
1046
1047         config->socks = socks;
1048
1049         nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
1050         if (!nsock) {
1051                 sockfd_put(sock);
1052                 return -ENOMEM;
1053         }

as then config->num_connections is not incremented and the cleanup code
freeing config->socks is skipped. Just make it run always.

Reported-by: syzbot+934037347002901b8d2a@syzkaller.appspotmail.com
Cc: stable@kernel.org
Signed-off-by: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
---
Compile tested only.
---
 drivers/block/nbd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 43cff01a5a67..f851883ef9f4 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1199,6 +1199,8 @@ static void nbd_config_put(struct nbd_device *nbd)
 	if (refcount_dec_and_mutex_lock(&nbd->config_refs,
 					&nbd->config_lock)) {
 		struct nbd_config *config = nbd->config;
+		int i;
+
 		nbd_dev_dbg_close(nbd);
 		nbd_size_clear(nbd);
 		if (test_and_clear_bit(NBD_RT_HAS_PID_FILE,
@@ -1206,14 +1208,11 @@ static void nbd_config_put(struct nbd_device *nbd)
 			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
 		nbd->task_recv = NULL;
 		nbd_clear_sock(nbd);
-		if (config->num_connections) {
-			int i;
-			for (i = 0; i < config->num_connections; i++) {
-				sockfd_put(config->socks[i]->sock);
-				kfree(config->socks[i]);
-			}
-			kfree(config->socks);
+		for (i = 0; i < config->num_connections; i++) {
+			sockfd_put(config->socks[i]->sock);
+			kfree(config->socks[i]);
 		}
+		kfree(config->socks);
 		kfree(nbd->config);
 		nbd->config = NULL;
 
-- 
2.17.1

