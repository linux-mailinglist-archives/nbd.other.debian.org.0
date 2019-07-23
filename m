Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AC07B722E2
	for <lists+nbd@lfdr.de>; Wed, 24 Jul 2019 01:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 7E1F0201E0; Tue, 23 Jul 2019 23:18:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Jul 23 23:18:11 2019
Old-Return-Path: <navid.emamdoost@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DKIM_VERIFIED,FOURLA,
	FREEMAIL_FROM,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 94C6320271
	for <lists-other-nbd@bendel.debian.org>; Tue, 23 Jul 2019 23:02:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id Oi21lImmdGqc for <lists-other-nbd@bendel.debian.org>;
	Tue, 23 Jul 2019 23:02:12 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 3549F20270
	for <nbd@other.debian.org>; Tue, 23 Jul 2019 23:02:09 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id j5so81291915ioj.8
        for <nbd@other.debian.org>; Tue, 23 Jul 2019 16:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WLivNX+IOU3BF5pVPZ4dT2PGyWr1z46q52x8JkbNVPY=;
        b=Z8CkXQHtW2MsPGieVx6RX8eY6KKzotV/eE19hybmIqhS5dToSWjnczzuz+1Uhz6rrh
         zxz4ZMS9cEwRPfXnSTKOW5vFjehBiljmlg3X5Oymz/MvTObEZ5yIV0dYXCM0cOuYiM47
         0+DQlGJ16dCKLm+K09Sdb6aVtLmafnOddQhhRip9PBFKIb7qv7GjaliBMwqhpP4po6ho
         2bd5iFeZBYllACr5dGiIlaK2i6/PSoPpL6wa1FI+xK2R7S7a/siCQNUhBTukQufvqygC
         aeugjPFBUR4ng4oCJi5khHw2z0OogUaddtLA//mvVhVcIGG4HRoj5TT20nHyXs3rDOX2
         bsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WLivNX+IOU3BF5pVPZ4dT2PGyWr1z46q52x8JkbNVPY=;
        b=mLZPLQPg5HwcTzx6OHfrn6Jogndiv1Vf/oqu+OxF5pm67rQ4CC3vG3tpXBvaxatiwg
         tjtaw53eyKIo8lJeDLfoQjCm+X2gtmLnnwHNFIuG71STEiVCHGLvXAaT42JqdJ7NbWRd
         8zQ6tWN17Gmxhg0MZ29CulKRzkoEb2MfTx4Pmyd2+5vghSTrfNVFguU2A18Bx7Z5jCzf
         bYnAUHn45m4nu0rVy+FK9vff5ZMY/FspIQabaetO/+/Tj2Tko4LXlEgib3dQrxg8Xvk/
         HoPfIVJXJOQeG4E0gUMtvn9ljA5JUM0rrW0WTh+vM+zUcvOQn4+8Ix2vWeFQZ5DnVQBC
         K8pA==
X-Gm-Message-State: APjAAAXhTCjdTuXT00Ar4P2yTc4B+VgYe9GHepmGqKOiceNIJD8y9+/8
	cNvCrYadotA2jfPofRx0DAQ=
X-Google-Smtp-Source: APXvYqx+pftMEVYYB/3f9Gf0UovCtgpLezh4sifw7pJ/oYZWL0Q9aQ7ncsyrdWy5Sdc+AS5N6YhmHw==
X-Received: by 2002:a02:37d6:: with SMTP id r205mr80277850jar.57.1563922925974;
        Tue, 23 Jul 2019 16:02:05 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id m10sm84918390ioj.75.2019.07.23.16.02.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 16:02:05 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Cc: emamd001@umn.edu,
	kjlu@umn.edu,
	smccaman@umn.edu,
	secalert@redhat.com,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nbd_genl_status: null check for nla_nest_start
Date: Tue, 23 Jul 2019 18:01:57 -0500
Message-Id: <20190723230157.14484-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GbymfpM0BmM.A.-6F.zW5NdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/602
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190723230157.14484-1-navid.emamdoost@gmail.com
Resent-Date: Tue, 23 Jul 2019 23:18:11 +0000 (UTC)

nla_nest_start may fail and return NULL. The check is inserted, and
errno is selected based on other call sites within the same source code.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 9bcde2325893..dba362de4d91 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2149,6 +2149,12 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+
+	if (!dev_list) {
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.17.1

