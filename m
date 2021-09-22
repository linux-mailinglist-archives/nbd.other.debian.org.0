Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB54149C9
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 14:54:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E9F4720C6F; Wed, 22 Sep 2021 12:54:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 12:54:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 367B320BD2
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 12:37:58 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id DdTSv_Ytzt_2 for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 12:37:53 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x534.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 251AF20BCB
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 12:37:52 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e7so2529172pgk.2
        for <nbd@other.debian.org>; Wed, 22 Sep 2021 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4r5hHsLSqFPjFI5wR4N7KCh9k5AlpvO2LM7FCfFcAxI=;
        b=hNagVhUiKO3N7yS2MkYebkvw28gd9fBFAbzhqf7VH2GBGjGxL/qe5rIoy1eduDkHFD
         SfLuyUuwoWQ8asyw3ItuYiLoP/UX6vp1x6FfvGGTwr6+8oFkzMeoNPR/6Yjojx6H8fqn
         W4+fj962NmO2LoUf5aSppXon2aGSwlQrgZFyQbQjlymg38riwZhg1ZdUMIoGXsLQ7Am4
         TelQVCzx8ePx8Scxa1bxFt95UagzdOcEoneMTo4rAplvxbNVER9/UfZQLd+Dtc1B9Cbq
         IfLP6dsDY9QCdDihlxlKUfHsCbQe2YRlTWNCBrnJaHhtltNCWcBXeVJxtTyCHuKtjkkC
         SSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4r5hHsLSqFPjFI5wR4N7KCh9k5AlpvO2LM7FCfFcAxI=;
        b=t7y35V541UCn0jCixwdA68rV7dODksZ2vUjZK6VSQFRWgEXbE8UhmLyHc8TRr2RtUg
         D8ZH42OqvEoMwWd3qGsE/mpV5WEgk9dmYR9OTA3eVCqzhDYZZ6XtZsry6f02s/X/VdOt
         +tkoBoQ6UwfLHAfhDVW+Z0EnbbO01j2YQ3U8gNc/HTPRP1RpqDpr2Q3slDeKjzHQ5NZZ
         d8H7i+LjQ0eg/jbwJ40POH/PsBMuHUrn3jjUSUpyGKMUEUqvVxPDZi04jhYfwIyFP2pl
         F52Z/6bRWrof/GNXKPehA3LQ8CysMdqJKTNXfCK38G/qMXRDmP28Mojat+yTRG/1dH04
         TI5w==
X-Gm-Message-State: AOAM533AYWWxr7bOoU4DAh8mFTQcr60zfdL9kWsAvmKrpHc2+JwpmdpC
	O/cbJoQ1upTTChEZeARPB+d6
X-Google-Smtp-Source: ABdhPJzNKppc244/mgKdjew5hR8qxaVzd/w+KiEBaHXaLnfD5kjRtFp/Ve/yoTpNrqiQWoO1x1/Mkg==
X-Received: by 2002:a62:6587:0:b0:445:824:58f2 with SMTP id z129-20020a626587000000b00445082458f2mr26165014pfb.82.1632314268225;
        Wed, 22 Sep 2021 05:37:48 -0700 (PDT)
Received: from localhost ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id fr17sm2268552pjb.17.2021.09.22.05.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:37:46 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH v2 0/4] Add invalidate_disk() helper for drivers to invalidate the gendisk
Date: Wed, 22 Sep 2021 20:37:07 +0800
Message-Id: <20210922123711.187-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <q1UlAAvS7TP.A.hJ.ydyShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1519
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210922123711.187-1-xieyongji@bytedance.com
Resent-Date: Wed, 22 Sep 2021 12:54:10 +0000 (UTC)

This series comes from Christoph Hellwig's suggestion [1]. Some block
device drivers such as loop driver and nbd driver need to invalidate
the gendisk when the backend is detached so that the gendisk can be
reused by the new backend. Now the invalidation is done in device
driver with their own ways. To avoid code duplication and hide
some internals of the implementation, this series adds a block layer
helper and makes both loop driver and nbd driver use it.

[1] https://lore.kernel.org/all/YTmqJHd7YWAQ2lZ7@infradead.org/

V1 to V2:
- Rename invalidate_gendisk() to invalidate_disk()
- Add a cleanup patch to remove bdev checks and bdev variable in __loop_clr_fd()

Xie Yongji (4):
  block: Add invalidate_disk() helper to invalidate the gendisk
  loop: Use invalidate_disk() helper to invalidate gendisk
  loop: Remove the unnecessary bdev checks and unused bdev variable
  nbd: Use invalidate_disk() helper on disconnect

 block/genhd.c         | 20 ++++++++++++++++++++
 drivers/block/loop.c  | 15 ++++-----------
 drivers/block/nbd.c   | 12 +++---------
 include/linux/genhd.h |  2 ++
 4 files changed, 29 insertions(+), 20 deletions(-)

-- 
2.11.0

