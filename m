Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AA042B023E
	for <lists+nbd@lfdr.de>; Wed, 11 Sep 2019 18:57:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 8A55E20682; Wed, 11 Sep 2019 16:57:18 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 11 16:57:18 2019
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
	by bendel.debian.org (Postfix) with ESMTP id 87F7B206F9
	for <lists-other-nbd@bendel.debian.org>; Wed, 11 Sep 2019 16:40:40 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.079 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FREEMAIL_FROM=0.001, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id xM0HkDvvg-ac for <lists-other-nbd@bendel.debian.org>;
	Wed, 11 Sep 2019 16:40:36 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 85B9A206E0
	for <nbd@other.debian.org>; Wed, 11 Sep 2019 16:40:33 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d17so25423187ios.13
        for <nbd@other.debian.org>; Wed, 11 Sep 2019 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Tl8NmQTauJTkodtSWs25AtKBiKIs4gXgEL1Drv1zzhk=;
        b=KrwK0M0dhLOpf2xNKKt7rOC/ir8cAmxu7g3OknTESI8+ndgvUAupbL8zdtSpJ9q9ya
         scfVgs+5s3OgeLS4tDRLlTlyQvcHFeY6n226EBv3elBq6Z2BMNbG9esOCL/nhHIFYSUy
         uAeu2TM04i6KT5YtI9oix9nRO5cAFmXAGNXyouGLmXgR7nugb0KC0YkTaScMZZUMEQh6
         EkZmBF3qzqz94I7bEwNr/SJgiFi8+0r0DmiZUp8chd3e4lzdbBfu42MptgfZ4l/zQkUe
         cHXsvM2IiBxyCBjIfFeb9BB2TUvi8z7qx3cT+osuZMmamwGPic6/fAVMt//zaD44jL5k
         vbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Tl8NmQTauJTkodtSWs25AtKBiKIs4gXgEL1Drv1zzhk=;
        b=pDYdhQYH04aAh/A1wKAuRBjjVoWTLHcxWnyA6YcNu+JRQVBOb2vgoD8i5DfCMBjNFw
         si719ZpRa6KlhXp2E8u9E/a23Nw7f3QmrOBmNrf9MyBCFPWvA6fV9paBweatkgCE0v7g
         aJ7Ilw2HzCe6hxb/K7iRPW4DizMzEXsKjrJvKazl84V5Fu4Isp4Hb+M7rKagjDzetYvr
         I1p6/T6AYLuTszwd6Q9TBI0owIcipA351V5W1P49RUwhh/hoSqTFtCOiFobRSWMhUkLR
         d0JRnl04jpsV7GcXksojTlBJh+suR/E0h9mRA+87iEbSvz9FD4sr3Htv2JdZZY+v12oM
         iY7A==
X-Gm-Message-State: APjAAAXuz04C1Wbyu007HP6MqaG/BIw0ZtdSFZe304GkUtAQF5xkMZ/y
	ySZYs6j9xSaVYf5PfBJdlMY=
X-Google-Smtp-Source: APXvYqzc+JQCdlEO9+dnSpChUka38hj/JdRKSAzWqwa3qzi+usVxxHxFWg7YZcVpoMqm0KSMXimWVg==
X-Received: by 2002:a5d:9153:: with SMTP id y19mr703021ioq.109.1568220030163;
        Wed, 11 Sep 2019 09:40:30 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
        by smtp.googlemail.com with ESMTPSA id c4sm16912886ioa.76.2019.09.11.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 09:40:29 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: mkubecek@suse.cz
Cc: emamd001@umn.edu,
	smccaman@umn.edu,
	kjlu@umn.edu,
	Navid Emamdoost <navid.emamdoost@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] nbd_genl_status: null check for nla_nest_start
Date: Wed, 11 Sep 2019 11:40:12 -0500
Message-Id: <20190911164013.27364-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910113521.GA9895@unicorn.suse.cz>
References: <20190910113521.GA9895@unicorn.suse.cz>
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <mToXOerya-H.A.BxG.udSedB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/689
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20190911164013.27364-1-navid.emamdoost@gmail.com
Resent-Date: Wed, 11 Sep 2019 16:57:18 +0000 (UTC)

nla_nest_start may fail and return NULL. The check is inserted, and
errno is selected based on other call sites within the same source code.
Update: removed extra new line.
v3 Update: added release reply, thanks to Michal Kubecek for pointing
out.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/block/nbd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index e21d2ded732b..8a9712181c2a 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -2149,6 +2149,12 @@ static int nbd_genl_status(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	dev_list = nla_nest_start_noflag(reply, NBD_ATTR_DEVICE_LIST);
+	if (!dev_list) {
+		nlmsg_free(reply);
+		ret = -EMSGSIZE;
+		goto out;
+	}
+
 	if (index == -1) {
 		ret = idr_for_each(&nbd_index_idr, &status_cb, reply);
 		if (ret) {
-- 
2.17.1

