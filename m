Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1B1B3B04
	for <lists+nbd@lfdr.de>; Wed, 22 Apr 2020 11:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id B6AC720484; Wed, 22 Apr 2020 09:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Apr 22 09:18:09 2020
Old-Return-Path: <houpu@bytedance.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 2D8AA20403
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Apr 2020 09:01:05 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id N3UPCGdYC0PQ for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Apr 2020 09:01:00 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .bytedance. - helo: .mail-pl1-x643.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id E116D203C9
	for <nbd@other.debian.org>; Wed, 22 Apr 2020 09:00:56 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d24so675399pll.8
        for <nbd@other.debian.org>; Wed, 22 Apr 2020 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=/lNHrzKG35VPMrePjYUYNbOK/+5taqOUGFBWUbMoiz0=;
        b=GF0DB9uCqX5LDfTa5GuQLRU6/cbJya7ug5Uk2gUZCxauRxJ2HDYzC4JTBgAhC4G/N8
         T2iXhEPZoi1t7o0qHG5q4r3cgcZiszl2tt/v6j+0BsFNYRpdfUBg7DAWiNH9L8+tjiDU
         UnDAfG7eeOa91E/xtSZKfpOl0HCPTMFSmFuqCJ2OBwugh7SJhRKVMhxxi/kRUybl9LSd
         kFd6gmxMdpq5L0zFVjh0iUfpsV/J9QuuWyIBc73IldxofXIH054YE3m92UMbCE7enClL
         thvtB1w2jwspELeSPYTQ3iptmVrmHZtpFJAnHd5ln85uVBqA3eeMRUyswr7O0e/6Db28
         utUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/lNHrzKG35VPMrePjYUYNbOK/+5taqOUGFBWUbMoiz0=;
        b=GUabFX0lGZY8396iU5ZY3bouKuehn0bHN8LeaONtQtVuuGokuiiz7CAgsr5+zbJ9Jw
         Z3XgkNIxBYLRzsAxg+Q5F0fYfB2IOnDQAd6m2v0KJ7/Q4JJs6ydPEXFJQDuVjdBUtCW6
         aq6yF4Kh4tcnhrXnNSP+9D7840/On5zF3TfG5WOjZlc+Z4krLCQHho0xpJ43/tb88xsr
         DTq33AEDUb8ld96pAEt902xDBqGmFZ4IvXPkcUrZwGBAO2zNp318iOca7pKMrtmBryHa
         dg5oxNsxoe0m2q6B6NVsJkEq3QB3IQS9RABp30Ig/vCAoVRbP8SP7sKBSFGQjBOKvpnK
         /3og==
X-Gm-Message-State: AGi0PubEkis/zQyNOAQkO6F2yWmrtWreul30waMwHK/NOi14TepbNM3n
	yEF+lxwSt5OGKcSapBF987pTjw==
X-Google-Smtp-Source: APiQypKsfBc3CfFgHX6D5DERQfxF2tR+yy5uYKa2Pi7RJWV+BaxEQNZbRWHg7yMlnTJT2sBFEA2JVQ==
X-Received: by 2002:a17:902:9004:: with SMTP id a4mr23509028plp.275.1587546053434;
        Wed, 22 Apr 2020 02:00:53 -0700 (PDT)
Received: from debian.bytedance.net ([61.120.150.75])
        by smtp.gmail.com with ESMTPSA id p66sm4660054pfb.65.2020.04.22.02.00.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 02:00:52 -0700 (PDT)
From: Hou Pu <houpu@bytedance.com>
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: mpa@pengutronix.de,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	Hou Pu <houpu@bytedance.com>
Subject: [PATCH 0/2] nbd: export dead connection timeout
Date: Wed, 22 Apr 2020 05:00:16 -0400
Message-Id: <20200422090018.23210-1-houpu@bytedance.com>
X-Mailer: git-send-email 2.11.0
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <Si8dZ40TsDP.A.PlH.RvAoeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/872
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20200422090018.23210-1-houpu@bytedance.com
Resent-Date: Wed, 22 Apr 2020 09:18:09 +0000 (UTC)

Here are two trivial patches:

Hou Pu (2):
  nbd: export dead_conn_timeout via debugfs
  nbd: set max discard sectors in the unit of sector

 drivers/block/nbd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)


Thanks,
Hou


-- 
2.11.0

