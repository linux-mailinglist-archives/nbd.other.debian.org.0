Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id A13715B0B68
	for <lists+nbd@lfdr.de>; Wed,  7 Sep 2022 19:24:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4CCC720345; Wed,  7 Sep 2022 17:24:12 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  7 17:24:12 2022
Old-Return-Path: <syoshida@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MD5_SHA1_SUM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,T_SCC_BODY_TEXT_LINE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6DF3620326
	for <lists-other-nbd@bendel.debian.org>; Wed,  7 Sep 2022 17:06:34 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.891 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.001,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MD5_SHA1_SUM=-1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id D_o0tNiuji6Y for <lists-other-nbd@bendel.debian.org>;
	Wed,  7 Sep 2022 17:06:27 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D076220347
	for <nbd@other.debian.org>; Wed,  7 Sep 2022 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662570381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A0VSNh+UywAONPBjLpCLWLZqP5s9DGWDr3ehS/v+q+A=;
	b=IIrqJzqZqpmrTn9garfMXQgD6xCljO9eDdnsOS0b9A9XXZvb104kfr4MPXyAk6jGLH+bd0
	DMf1QKQpWOzQo+3u/2TPyCTFHN2FViiV01FOzhHRLgANPSbclvcnxDZJ/+go58YrbnMuli
	2VG0EQFpu7IX71oP0YRAu1c6Wogo448=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-yPIQAjRXPUqs9nlPAMAoGA-1; Wed, 07 Sep 2022 12:35:15 -0400
X-MC-Unique: yPIQAjRXPUqs9nlPAMAoGA-1
Received: by mail-pg1-f200.google.com with SMTP id m188-20020a633fc5000000b00434dccacd4aso1824170pga.10
        for <nbd@other.debian.org>; Wed, 07 Sep 2022 09:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=A0VSNh+UywAONPBjLpCLWLZqP5s9DGWDr3ehS/v+q+A=;
        b=QFJvl391rfUXr5GsK/K+2EBxNY1pPkLZnxeh4xuSZ3d3BFljcgx2ecoF4q7xeW/Akj
         cCggxjvXjN7UEYVy7rtS+ip08R3LuRqXUjbVmrU2daLDzl+LjmkV7Llv7pyQSeJWBkOx
         BjasxV7zkaHI8QRly4yRBiL0nvPNRrMX8GZRcEJlgmbSIRjF1zmEQooidn5MJv90yi4H
         p1lXGdFQxR2FnT6zC9s1ExcmouXJPPGshbstxlJWzOqmo8rz0F6GXWQmd7/7Q5PEjKmQ
         UK6/Ru8CAB75C1MWcd2NC5gHrGAmvnvyLBctbSsFeR5I8EqrTp2nZLlLcU0tmEfif/od
         ERNA==
X-Gm-Message-State: ACgBeo2v2dWhgJSeldfoHl/DECe9L3u05fLOCC9eQkTkbfzV48snlGfa
	CTO5HgUmL3maRaNW8iup7QJy1C86qDlJOPDD6pPqQDtV0JlmTwQAIsoNIcQJsz6RzMfVVqIK1KU
	E0Gf5r08HK9PpVA==
X-Received: by 2002:a17:902:9b85:b0:16e:cc02:b9b2 with SMTP id y5-20020a1709029b8500b0016ecc02b9b2mr4538456plp.74.1662568514415;
        Wed, 07 Sep 2022 09:35:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7r/x7CdhyIi+Ws6YtHvtEtvjDAJ5wS2GD6N2EGK8KrkbtXG4v7M/3xt+UtWy169uWDtkAVJg==
X-Received: by 2002:a17:902:9b85:b0:16e:cc02:b9b2 with SMTP id y5-20020a1709029b8500b0016ecc02b9b2mr4538435plp.74.1662568514147;
        Wed, 07 Sep 2022 09:35:14 -0700 (PDT)
Received: from xps13.. ([240d:1a:c0d:9f00:4f2f:926a:23dd:8588])
        by smtp.gmail.com with ESMTPSA id e22-20020aa79816000000b00537e328bc11sm12688689pfl.31.2022.09.07.09.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 09:35:13 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	syzbot+38e6c55d4969a14c1534@syzkaller.appspotmail.com
Subject: [PATCH] nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
Date: Thu,  8 Sep 2022 01:35:02 +0900
Message-Id: <20220907163502.577561-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Mi-kbo86oML.A.cKB.8ONGjB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/2216
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20220907163502.577561-1-syoshida@redhat.com
Resent-Date: Wed,  7 Sep 2022 17:24:12 +0000 (UTC)

syzbot reported hung task [1].  The following program is a simplified
version of the reproducer:

int main(void)
{
	int sv[2], fd;

	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv) < 0)
		return 1;
	if ((fd = open("/dev/nbd0", 0)) < 0)
		return 1;
	if (ioctl(fd, NBD_SET_SIZE_BLOCKS, 0x81) < 0)
		return 1;
	if (ioctl(fd, NBD_SET_SOCK, sv[0]) < 0)
		return 1;
	if (ioctl(fd, NBD_DO_IT) < 0)
		return 1;
	return 0;
}

When signal interrupt nbd_start_device_ioctl() waiting the condition
atomic_read(&config->recv_threads) == 0, the task can hung because it
waits the completion of the inflight IOs.

This patch fixes the issue by clearing queue, not just shutdown, when
signal interrupt nbd_start_device_ioctl().

Link: https://syzkaller.appspot.com/bug?id=7d89a3ffacd2b83fdd39549bc4d8e0a89ef21239 [1]
Reported-by: syzbot+38e6c55d4969a14c1534@syzkaller.appspotmail.com
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/block/nbd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2a709daefbc4..2a2a1d996a57 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1413,10 +1413,12 @@ static int nbd_start_device_ioctl(struct nbd_device *nbd)
 	mutex_unlock(&nbd->config_lock);
 	ret = wait_event_interruptible(config->recv_wq,
 					 atomic_read(&config->recv_threads) == 0);
-	if (ret)
+	if (ret) {
 		sock_shutdown(nbd);
-	flush_workqueue(nbd->recv_workq);
+		nbd_clear_que(nbd);
+	}
 
+	flush_workqueue(nbd->recv_workq);
 	mutex_lock(&nbd->config_lock);
 	nbd_bdev_reset(nbd);
 	/* user requested, ignore socket errors */
-- 
2.37.3

