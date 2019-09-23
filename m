Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id C863EBBCCC
	for <lists+nbd@lfdr.de>; Mon, 23 Sep 2019 22:27:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 90E5920538; Mon, 23 Sep 2019 20:27:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 23 20:27:08 2019
Old-Return-Path: <navid.emamdoost@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FREEMAIL_FROM,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0620C20502
	for <lists-other-nbd@bendel.debian.org>; Mon, 23 Sep 2019 20:10:14 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id rtkeSP-JxwY5 for <lists-other-nbd@bendel.debian.org>;
	Mon, 23 Sep 2019 20:10:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3B79320501
	for <nbd@other.debian.org>; Mon, 23 Sep 2019 20:10:11 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j4so36579997iog.11
        for <nbd@other.debian.org>; Mon, 23 Sep 2019 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=O4biPIS8QtKs0W4x755+TgKPEkw6EcSzOJulQCgOdjc=;
        b=njkIaQHgxTxbxvCQR+vWZUivpNX+akdE2x1/MQJw6UKmijwTx7tDcioLHiCWPOR1As
         2ezrnErR4qB8uh5MPY9oEv+uSM+Yzw/FRYBhw8dUYeyi36bRn1esr9cA/moDArP0sFZO
         LGNq6sY8q+rH4eZD8M9rBBLYCIA63O53qsuJg3l4L71c0iViJsYoVlmixUSG9VxlEIL9
         C3EhOLUS41GYEj5FzzL8m5OW+2FjNCBFan5Rp0exvo2AFgkvJbI1M5+zlSAjo9oBDfMA
         880tkUs8fWGcC0yy1IzZjl/jqMc0dUMUbOBiRvEH3wl02pg2sacrZ15uiGq8kAeBlwgi
         5zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=O4biPIS8QtKs0W4x755+TgKPEkw6EcSzOJulQCgOdjc=;
        b=XaO6wQsSN1O3QV7c5GFfTSq6JydVcl3hjBEQq6Mc8Bp+sGR0DFSWQeCrV7yM9j6G5+
         7hTPFzHiLVcHJCBPS1GTq0GbDhm0/19MtG3dEuXAx1let2/uScNgI81t9waOxLEMPAmq
         rjRiTxxBP3P+o0I9v2tp6N9NeIXoG2j30H/SPeimuTsm0cOCtVbuZ1ykC4oNu/nXakGZ
         IIDdG4trQIW+ysb7HsLXEB/mKR5JFmDtvRjN1ffr9NDeJLwRUuCb91JQF+EYg7hR1SSX
         J9jBqTplt8YC2EU9vF2vYMcssJBSrQce34bNyoj9idJJv3rKIvD9p3nH/4iASC10i8nd
         XoXQ==
X-Gm-Message-State: APjAAAW/FHUZj774xON4gh4iXyabrLdHs7fHtnYcQe7ejTaXjvEMyTE+
	y0NYi0vryFO273VyQJhZS3g=
X-Google-Smtp-Source: APXvYqzRCHe8NZfJwm/rb4Y5QIs6ohRRrof7MdIT+Pa/qzCoh0RmIrYSXWnnIw9K2UCgqWwuS2kRUw==
X-Received: by 2002:a05:6602:2244:: with SMTP id o4mr1238924ioo.107.1569269407973;
        Mon, 23 Sep 2019 13:10:07 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id d9sm10877889ioq.9.2019.09.23.13.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 13:10:07 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Cc: emamd001@umn.edu,
	smccaman@umn.edu,
	kjlu@umn.edu,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nbd: prevent memory leak
Date: Mon, 23 Sep 2019 15:09:58 -0500
Message-Id: <20190923200959.29643-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YcvkcOZMUEI.A.bfH.cqSidB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/697
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190923200959.29643-1-navid.emamdoost@gmail.com
Resent-Date: Mon, 23 Sep 2019 20:27:08 +0000 (UTC)

In nbd_add_socket when krealloc succeeds, if nsock's allocation fail the
reallocted memory is leak. The correct behaviour should be assigning the
reallocted memory to config->socks right after success.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/block/nbd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index a8e3815295fe..8ae3bd2e7b30 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -987,14 +987,15 @@ static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
 		sockfd_put(sock);
 		return -ENOMEM;
 	}
+
+	config->socks = socks;
+
 	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
 	if (!nsock) {
 		sockfd_put(sock);
 		return -ENOMEM;
 	}
 
-	config->socks = socks;
-
 	nsock->fallback_index = -1;
 	nsock->dead = false;
 	mutex_init(&nsock->tx_lock);
-- 
2.17.1

