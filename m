Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6CC408A74
	for <lists+nbd@lfdr.de>; Mon, 13 Sep 2021 13:42:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id EAD53203AD; Mon, 13 Sep 2021 11:42:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 13 11:42:10 2021
Old-Return-Path: <xieyongji@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id AA7992037F
	for <lists-other-nbd@bendel.debian.org>; Mon, 13 Sep 2021 11:26:47 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id AzrznyFpIifb for <lists-other-nbd@bendel.debian.org>;
	Mon, 13 Sep 2021 11:26:42 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pg1-x52c.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 5E50520371
	for <nbd@other.debian.org>; Mon, 13 Sep 2021 11:26:41 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id f129so9159572pgc.1
        for <nbd@other.debian.org>; Mon, 13 Sep 2021 04:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rz/6XvgdNoOIdVbvI4mwKeVZY1sVrkUVZ3EnU4pT4rU=;
        b=Xk6Azf+YawiKfB5FY+ef0aHr4lcGmXzfcSyku4T4sJF73uZuN7SuifATbWcVwyFU5S
         LMimQVl/YGeEa/gZorRlhViYpISoiOl59jeoMWzkB1QVz4UQ6LXg9arGIWWbhP33CbB4
         FUof3AjR9QK9p9KxbJbTw6mQ81lbfAR0U4mX3Y0T8smzt3OjfE2KS7kYd+eoM8WcAanX
         C3HnXx8iWpORlaiK0l6G6V4W1d+DR2vzboZ1PH2Gy3Iws1cMzfp/r3wwJaGYuaRPPCAJ
         Pe/gLNl1O6FewaFSGs8FULYW/e+qk1EI/LEf7vsshPkZKLAL/AiuH6tmqWaSIuX/z/wZ
         GhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rz/6XvgdNoOIdVbvI4mwKeVZY1sVrkUVZ3EnU4pT4rU=;
        b=TWcRRrJ+zr9APyaCm5cmqC2wa8Wrwp7jnLkowSKblwGXt88fxlMnEvkMywMFOPEggh
         5Y4pHzSRqwNpSPnDE+TsThx4wU0QDAx8yArEgjODnwag78cJzx2IFEH+TobBXx+VVWFi
         SI1Rc+TpVdY90U1eOGpQEPZQMuMaAYqcgiLg4r2Lulyl6zw1LtpYazUiwvHVRGusZ72m
         K8pk0nO76tScGx+JX88B/ei6ujkTrxj2c25fxXz/Y0gUcJSD8fTnH2WjMZqQ6fMJckVZ
         +4VYa6fZ84cEjbCPY3yYMxOCAesGUXy9bgUkUVqHRLiaIyRCosFBxRkpmNhGmObyc5rd
         GJGw==
X-Gm-Message-State: AOAM531tpfq2gUpykg01KmLoVWuA7Z1Y2N+b/aeI3UnbexZe5DWaRfKs
	aIprWTUJ4FOesBa2ZOQV6X8oWqacKCMNXMA=
X-Google-Smtp-Source: ABdhPJxgADjQmayK/fwksa0871G2vOcC21wpaydwkHKLFWhnke6wadGoJpZKsE7E0mYF9wrc4AnAyw==
X-Received: by 2002:a62:1c96:0:b0:3f5:e01a:e47 with SMTP id c144-20020a621c96000000b003f5e01a0e47mr10705481pfc.76.1631532397740;
        Mon, 13 Sep 2021 04:26:37 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id w188sm6726703pfd.32.2021.09.13.04.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 04:26:37 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: axboe@kernel.dk,
	josef@toxicpanda.com,
	hch@infradead.org
Cc: linux-block@vger.kernel.org,
	nbd@other.debian.org,
	yixingchen@bytedance.com
Subject: [PATCH 0/3] Add invalidate_gendisk() helper for drivers to invalidate the gendisk
Date: Mon, 13 Sep 2021 19:25:54 +0800
Message-Id: <20210913112557.191-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <jo8v08VEJJF.A.L6C.SkzPhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1434
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20210913112557.191-1-xieyongji@bytedance.com
Resent-Date: Mon, 13 Sep 2021 11:42:10 +0000 (UTC)

This series comes from Christoph Hellwig's suggestion [1]. Some block
device drivers such as loop driver and nbd driver need to invalidate
the gendisk when the backend is detached so that the gendisk can be
reused by the new backend. Now the invalidation is done in device
driver with their own ways. To avoid code duplication and hide
some internals of the implementation, this series adds a block layer
helper and makes both loop driver and nbd driver use it.

[1] https://lore.kernel.org/all/YTmqJHd7YWAQ2lZ7@infradead.org/

Xie Yongji (3):
  block: Add invalidate_gendisk() helper to invalidate the gendisk
  loop: Use invalidate_gendisk() helper to invalidate gendisk
  nbd: Use invalidate_gendisk() helper on disconnect

 block/genhd.c         | 21 +++++++++++++++++++++
 drivers/block/loop.c  |  6 +-----
 drivers/block/nbd.c   | 12 +++---------
 include/linux/genhd.h |  1 +
 4 files changed, 26 insertions(+), 14 deletions(-)

-- 
2.11.0

