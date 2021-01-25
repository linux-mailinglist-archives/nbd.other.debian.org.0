Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385530291C
	for <lists+nbd@lfdr.de>; Mon, 25 Jan 2021 18:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DE23320440; Mon, 25 Jan 2021 17:39:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Jan 25 17:39:08 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,SARE_MSGID_LONG40
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 7DD0F20461
	for <lists-other-nbd@bendel.debian.org>; Mon, 25 Jan 2021 17:21:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.343 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	SARE_MSGID_LONG40=0.637] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id r-lSJNBzyyey for <lists-other-nbd@bendel.debian.org>;
	Mon, 25 Jan 2021 17:21:12 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x730.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 0A70B2051C
	for <nbd@other.debian.org>; Mon, 25 Jan 2021 17:21:08 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id r77so13018957qka.12
        for <nbd@other.debian.org>; Mon, 25 Jan 2021 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VjbQBJvvk1x9RhHKts283wh1E1XENs+E9cWM4klUsv8=;
        b=IdUMp8vKZZyarCmt+37it4NBDMUzI9zAtlL6/P38VH7XdSvfueMB8GmnA8WVjX3EE0
         xr5Yd2xTlC0sdtPFE+zRttrxS4t6Gvk3EPAI+oXWQ6CnJFyKIKEIe9p9fgIv3RXPBOhG
         BAgfc55rUYqXsnZ5EFXopQBKXCK5MqvTEoLRJUr1Kool371yMPpiVjTgjuIM0HeiOwGi
         KbjPoPefu74uae0cWqHXyRLQE2w73OmId5kIwFatbFDNVauQpvF4pEenxIFq9O5vRhDd
         xmcNXzf9EZrZFnsX+gMWiytNnePrKKORDhaAmRZt+3RXpATpb+Izllf6/ABsRzcOrBR5
         fj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VjbQBJvvk1x9RhHKts283wh1E1XENs+E9cWM4klUsv8=;
        b=DVFGYP6BzHuOkhJO2rdGaHop5P6cZENRCoWyQ6Y4Xwk1xRL+72spkLr/1YiSzL6Q2f
         vUiu527IJ+hHQKQ4CyJ3F5bjzbjziHzrLaTJZDMbd3NtQ+rJn25Ukgr2O2GM2cOqUED3
         HCleYuA++kmENWt2Wj4eFdUm5yVSIXeQUQ9cQ+DmBpVHf5/8uPvFCJGJgU8qE8o2KA0+
         gD6VNNfBVNewePF38clPIeoM335e3fv/yyGngKTZ2FO0YUInNdoK5dpI2qvhSfUF70jm
         H5YtqLFEDkF5VQ/VJJBESZsi8FxHP3S3CUe/FXYnR7BHD9mg8TlvVQVXdQicYfoq5rgb
         Y3XA==
X-Gm-Message-State: AOAM5332C/qD5ElnUFx7ncR+cRYnESox602ynxXQ8DcJKyKMO9IX5scS
	A9hGBzE/34cFjheBhG5WpvgAaQ==
X-Google-Smtp-Source: ABdhPJwf2a443n85MWiyGE6ZUfYq6QwaJdNABw7AgzhCntBeNYvD5pGZ6lj5VZ/3XVu2lFy0sfOSrQ==
X-Received: by 2002:a37:ba84:: with SMTP id k126mr1794616qkf.306.1611595265056;
        Mon, 25 Jan 2021 09:21:05 -0800 (PST)
Received: from localhost (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id d9sm4693414qko.84.2021.01.25.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:21:03 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
To: axboe@kernel.dk,
	nbd@other.debian.org,
	linux-block@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH] nbd: freeze the queue while we're adding connections
Date: Mon, 25 Jan 2021 12:21:02 -0500
Message-Id: <24dff677353e2e30a71d8b66c4dffdbdf77c4dbd.1611595239.git.josef@toxicpanda.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <pKaWmohVUTC.A.sF.8IwDgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1105
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/24dff677353e2e30a71d8b66c4dffdbdf77c4dbd.1611595239.git.josef@toxicpanda.com
Resent-Date: Mon, 25 Jan 2021 17:39:08 +0000 (UTC)

When setting up a device, we can krealloc the config->socks array to add
new sockets to the configuration.  However if we happen to get a IO
request in at this point even though we aren't setup we could hit a UAF,
as we deref config->socks without any locking, assuming that the
configuration was setup already and that ->socks is safe to access it as
we have a reference on the configuration.

But there's nothing really preventing IO from occurring at this point of
the device setup, we don't want to incur the overhead of a lock to
access ->socks when it will never change while the device is running.
To fix this UAF scenario simply freeze the queue if we are adding
sockets.  This will protect us from this particular case without adding
any additional overhead for the normal running case.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/nbd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 6727358e147d..e6ea5d344f87 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1022,6 +1022,12 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	if (!sock)
 		return err;
 
+	/*
+	 * We need to make sure we don't get any errant requests while we're
+	 * reallocating the ->socks array.
+	 */
+	blk_mq_freeze_queue(nbd->disk->queue);
+
 	if (!netlink && !nbd->task_setup &&
 	    !test_bit(NBD_RT_BOUND, &config->runtime_flags))
 		nbd->task_setup = current;
@@ -1060,10 +1066,12 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 	nsock->cookie = 0;
 	socks[config->num_connections++] = nsock;
 	atomic_inc(&config->live_connections);
+	blk_mq_unfreeze_queue(nbd->disk->queue);
 
 	return 0;
 
 put_socket:
+	blk_mq_unfreeze_queue(nbd->disk->queue);
 	sockfd_put(sock);
 	return err;
 }
-- 
2.26.2

