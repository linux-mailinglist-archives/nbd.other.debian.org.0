Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 187E34028CE
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 14:30:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D188A20C81; Tue,  7 Sep 2021 12:30:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 12:30:13 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 4EE0B20C36
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 12:15:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id WhVYipCVd580 for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 12:14:56 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pf1-x42a.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 36D5A20C5F
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 12:14:55 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id s29so8011316pfw.5
        for <nbd@other.debian.org>; Tue, 07 Sep 2021 05:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3OZzx+1z6a5c3h3/Sw4pkfFh4EnMP/repP35Q9oKekA=;
        b=OqS7cUnQkPbNnMkKpcwQYzBj23Jep1CoAOlKrTlX406HtEfhAYiOnXCHxlPNYzrJhY
         1IoNmsm2U3KM+oc6wg4G5PyviENAQQtxiqZBFJ1nZp6i4JQgAm+6VT/LmXYaAn44GPXu
         izedj31QPvs2sNUHgFFIO70Ehu8raKq+YjCx/iNvwnh15s9vVUO0WU+bAL9NV/zYxnLF
         s6TYn5hpGWgK6FF6ydWUKa3e5E7YOjXHrlSTDU0TN+8uhdT4rCBas4zYYl8PmvcNXN3I
         ZXBbL8FA6O/r8xFsuc2vrO66DNjqG8L7BCY2M7zTX07+mpef7CXBvmRF4Kgaxc1lGwyp
         8Niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3OZzx+1z6a5c3h3/Sw4pkfFh4EnMP/repP35Q9oKekA=;
        b=V76fxNXjd6vo8aKSa7OLQZQgycGnHz9bq/NN+hNDuHIMk1rvuGVbQ6Sqo4CoXjWXnI
         lgnQI2NGrMeE49/LhZ80orog2uoQTE8UcW1ywSSf0eRwmZzU/vUIbgyJHKiNE1CX+qxq
         LSsjqU3YbDNdhW8ulHvAmhhnNGQh0J9ln2Hth4ixOjsnbmFIDsTHw0bcyPe2G+7+xPRQ
         F+Y/vDjoHKSJAbW224HezakScSj3NX93c6dAn7zlaJ/286CNyyV2o2Ru5CTSgg8j5XzT
         qSN02NnPICMiz1K1Q67IxDXhcGq335lpZt+Y9PwOw41NP3iOP1UQdfGaOhhekhEP7/2+
         QAtA==
X-Gm-Message-State: AOAM531nlK8mYcANGfDWsJZ0zSNYjAcwCs3GEqkyQMqeb0BrTTNHFauI
	jbNn6eLGCQqvrRKUqoRBgGZ9
X-Google-Smtp-Source: ABdhPJzXdhI0AW8X6rWI5d155rZEK25relN1WCn71YhruAKV3G7gKgsoU7Od0IZyq9OnUYm1/cXQSg==
X-Received: by 2002:a63:4614:: with SMTP id t20mr16678272pga.372.1631016891594;
        Tue, 07 Sep 2021 05:14:51 -0700 (PDT)
Received: from localhost ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id y6sm2476684pjr.48.2021.09.07.05.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 05:14:50 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH] nbd: clear wb_err in bd_inode on disconnect
Date: Tue,  7 Sep 2021 20:14:25 +0800
Message-Id: <20210907121425.91-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <b3vxBpLrK8N.A.LP.Vt1NhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1399
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210907121425.91-1-xieyongji@bytedance.com
Resent-Date: Tue,  7 Sep 2021 12:30:13 +0000 (UTC)

When a nbd device encounters a writeback error, that error will
get propagated to the bd_inode's wb_err field. Then if this nbd
device's backend is disconnected and another is attached, we will
get back the previous writeback error on fsync, which is unexpected.
To fix it, let's clear out the wb_err on disconnect.

Reported-by: Yi Xingchen <yixingchen@bytedance.com>
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 drivers/block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..e6aa804db541 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1233,6 +1233,7 @@ static void nbd_config_put(struct nbd_device *nbd)
 		struct nbd_config *config = nbd->config;
 		nbd_dev_dbg_close(nbd);
 		nbd_size_clear(nbd);
+		nbd->disk->part0->bd_inode->i_mapping->wb_err = 0;
 		if (test_and_clear_bit(NBD_RT_HAS_PID_FILE,
 				       &config->runtime_flags))
 			device_remove_file(disk_to_dev(nbd->disk), &pid_attr);
-- 
2.11.0

